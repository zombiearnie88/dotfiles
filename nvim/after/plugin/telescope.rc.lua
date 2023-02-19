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
			".git",
		},
	},
	extensions = {
		-- ["ui-select"] = {
		-- 	require("telescope.themes").get_dropdown({
		-- 		-- even more opts
		-- 	}),
		-- },
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
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
telescope.load_extension("fzf")

-- KEY MAPPING
-- Vim Pickers
vim.keymap.set("n", "<leader>ff", function()
	builtin.find_files({
		no_ignore = false,
		hidden = true,
	})
end)
vim.keymap.set("n", "<leader>fg", function()
	builtin.live_grep()
end)
vim.keymap.set("n", "<leader>fb", function()
	builtin.buffers() -- list open buffers
end)
vim.keymap.set("n", "<leader>fm", function()
	builtin.marks({
		initial_mode = "normal",
	}) -- list vim marks and their value
end)
vim.keymap.set("n", "<leader>ft", function()
	builtin.help_tags()
end)
-- vim.keymap.set("n", ";;", function()
-- 	builtin.resume()
-- end)
vim.keymap.set("n", "<leader>fe", function()
	builtin.diagnostics({
		initial_mode = "normal",
	})
end)

-- LSP pickers
vim.keymap.set("n", "<leader>go", function()
	builtin.lsp_document_symbols() -- list outline symbols
end)

vim.keymap.set("n", "<leader>gi", function()
	builtin.lsp_implementations()
end)

vim.keymap.set("n", "<leader>gd", function()
	builtin.lsp_definitions()
end)

vim.keymap.set("n", "<leader>gf", function()
	builtin.lsp_references()
end)

vim.keymap.set("n", "<leader>fn", function()
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
