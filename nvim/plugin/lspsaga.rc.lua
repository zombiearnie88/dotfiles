local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	finder = {
		max_height = 0.6,
		keys = {
			vsplit = "<C-v>",
			split = "<C-h>",
		},
	},
	definition = {
		keys = {
			edit = "<C-o>",
			vsplit = "<C-v>",
			split = "<C-h>",
		},
	},
	lightbulb = {
		enable = false,
		enable_in_insert = false,
		sign = false,
		sign_priority = 40,
		virtual_text = false,
	},
	symbol_in_winbar = {
		enable = false,
		separator = " ",
		hide_keyword = true,
		show_file = true,
		folder_level = 2,
		respect_root = false,
		color_mode = true,
	},
})

local keymap = vim.keymap.set

-- Float terminal
-- Lazygit
keymap({ "n", "t" }, "<leader>lz", "<cmd>Lspsaga term_toggle lazygit<CR>", { silent = true })
-- htop
keymap({ "n", "t" }, "<leader>ht", ":Lspsaga term_toggle htop<CR>", { silent = true })

-- Toggle floaterm <A-d> = ∂
keymap({ "n", "t" }, "∂", "<cmd>Lspsaga term_toggle<CR>", { silent = true })
-- keymap("t", "∂", [[<C-\><C-n><cmd>Lspsaga term_toggle<CR>]], { silent = true })
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
-- keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
