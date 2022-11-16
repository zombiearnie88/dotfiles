local status, buffdelete = pcall(require, "bufdelete")
if not status then
	return
end

-- mapping
vim.api.nvim_set_keymap("n", "∑", ":Bdelete<CR>", { noremap = true, silent = true }) -- alt + w
vim.api.nvim_set_keymap("n", "„", ":Bwipeout<CR>", { noremap = true, silent = true }) -- alt + W
vim.api.nvim_set_keymap("n", "<A-w>", ":Bdelete<CR>", { noremap = true, silent = true }) -- alt + w
vim.api.nvim_set_keymap("n", "<A-W>", ":Bwipeout<CR>", { noremap = true, silent = true }) -- alt + W
