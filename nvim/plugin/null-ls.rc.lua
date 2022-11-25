local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		async = true,
		bufnr = bufnr,
	})
end

null_ls.setup({
	sources = {
		--#formatters
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.prismaFmt,

		--#diagnostics/linters
		null_ls.builtins.diagnostics.eslint_d,
		null_ls.builtins.diagnostics.flake8,

		--#code actions
		null_ls.builtins.code_actions.eslint_d,
		require("typescript.extensions.null-ls.code-actions"),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- map <leader>f to formatting
			vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format( { async = true })<CR>")

			-- enable format on save
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
