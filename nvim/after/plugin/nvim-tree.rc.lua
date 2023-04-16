local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

--print('nvim tree loaded')

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	sort_by = "case_sensitive",
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		group_empty = true,
		indent_width = 2,
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	remove_keymaps = { "s" },
	view = {
		-- adaptive_size = true,
		width = 30,
		side = "left",
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
				{ key = "h", cb = tree_cb("close_node") },
				{ key = "v", cb = tree_cb("vsplit") },
				{ key = "<C-s>", action = "system_open" },
				{ key = "n", action = "create" },
			},
		},
	},
	filters = {
		dotfiles = false,
		custom = { "^.git$", "^node_modules" },
	},
})

-- mapping
vim.api.nvim_set_keymap("n", "ss", ":NvimTreeFocus<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "sw", ":NvimTreeClose<cr>", { noremap = true, silent = true })
