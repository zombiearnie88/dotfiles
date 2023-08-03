local status, ufo = pcall(require, "ufo")
if not status then
	return
end

-- print('ufo loaded')

vim.o.foldcolumn = "1"
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- custom folding text
local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (" 󱞥%d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "MoreMsg" })
	return newVirtText
end

-- code folding using lsp, treesitter
local foldMap = {
	vim = "indent",
	git = "",
	lua = "treesitter",
	json = "treesitter",
	typescript = "lsp",
	javascript = "lsp",
	typescriptreact = "lsp",
	javascriptreact = "lsp",
}
ufo.setup({
	fold_virt_text_handler = handler,
	provider_selector = function(bufnr, filetype, buftype)
		-- return { "treesitter", "lsp" }
		-- print('ufo filetype', filetype)
		if foldMap[filetype] == nil then
			return "indent"
		end

		return foldMap[filetype]
	end,
})

-- buffer scope handler
-- will override global handler if it is existed
local bufnr = vim.api.nvim_get_current_buf()
ufo.setFoldVirtTextHandler(bufnr, handler)

-- Custom fold provider
-- ufo.setup({
--   provider_selector = function(bufnr, filetype, buftype)
--     return { "lsp", "treesitter" }
--   end
-- })

-- KEYMAPs
vim.keymap.set("n", "zR", ufo.openAllFolds)
vim.keymap.set("n", "zM", ufo.closeAllFolds)
vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds)
vim.keymap.set("n", "zm", ufo.closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)

-- hover fold
vim.keymap.set("n", "K", function()
	local winid = ufo.peekFoldedLinesUnderCursor()
	if not winid then
		-- choose one of them
		-- coc.nvim
		-- vim.fn.CocActionAsync('definitionHover')

		-- nvimlsp
		vim.lsp.buf.hover()
	end
end)
