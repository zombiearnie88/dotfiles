local status, zen = pcall(require, "true-zen")
if not status then
	return
end

zen.setup({
	integrations = {
		tmux = true, -- hide tmux status bar in (minimalist, ataraxis)
		lualine = true, -- hide nvim-lualine (ataraxis)
	},
})

local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
keymap("n", "<leader>zf", ":TZFocus<CR>", {})
keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
