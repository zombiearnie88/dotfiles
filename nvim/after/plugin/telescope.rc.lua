local status, telescope = pcall(require, "telescope")
if not status then
	return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
		file_ignore_patterns = {
			"node_modules",
		},
	},
	extensions = {
		-- ["ui-select"] = {
		-- 	require("telescope.themes").get_dropdown({
		-- 		-- even more opts
		-- 	}),
		-- },
		file_browser = {
			theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				-- your custom insert mode mappings
				["i"] = {
					["<C-w>"] = function()
						vim.cmd("normal vbd")
					end,
				},
				["n"] = {
					-- your custom normal mode mappings
					["N"] = fb_actions.create,
					["R"] = fb_actions.rename,
					["Y"] = fb_actions.copy,
					["D"] = fb_actions.remove,
					["M"] = fb_actions.move,
					["G"] = fb_actions.goto_parent_dir,
					["W"] = fb_actions.goto_cwd,
					["H"] = fb_actions.toggle_hidden,
					["F"] = fb_actions.toggle_browser,
					["/"] = function()
						vim.cmd("startinsert")
					end,
				},
			},
		},
	},
})

-- Load extensions
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

-- KEY MAPPING
-- Vim Pickers
vim.keymap.set("n", "sf", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", "sg", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "sb", function()
	builtin.buffers() -- list open buffers
end)
vim.keymap.set("n", "sm", function()
	builtin.marks() -- list vim marks and their value
end)
vim.keymap.set("n", "st", function()
	builtin.help_tags()
end)
-- vim.keymap.set("n", ";;", function()
-- 	builtin.resume()
-- end)
vim.keymap.set("n", "se", function()
	builtin.diagnostics()
end)

-- LSP pickers
vim.keymap.set("n", "go", function()
	builtin.lsp_document_symbols()
end)

vim.keymap.set("n", "gi", function()
	builtin.lsp_implementations()
end)

vim.keymap.set("n", "gf", function()
	builtin.lsp_references()
end)

vim.keymap.set("n", "sn", function()
	telescope.extensions.file_browser.file_browser({
		path = "%:p:h",
		cwd = telescope_buffer_dir(),
		respect_gitignore = false,
		hidden = true,
		grouped = true,
		previewer = false,
		initial_mode = "normal",
		layout_config = { height = 40 },
	})
end)

-- vim.keymap.set("n", "fy", function()
-- 	telescope.extensions.yank_history()
-- end)
