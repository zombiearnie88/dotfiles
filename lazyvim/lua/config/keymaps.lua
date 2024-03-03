-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.api.nvim_set_keymap
-- local keymap_del = vim.api.nvim_del_keymap

local opts = { noremap = true, silent = true }

-- NORMAL MODE
-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- clear highlight
opts.desc = "Clear hightlight"
keymap("n", "cl", ":noh<cr>", opts)

-- insert line in normal mode
opts.desc = "Insert line below"
keymap("n", "<leader>o", "o<Esc>", opts) -- insert line below
opts.desc = "Insert line above"
keymap("n", "<leader>O", "O<Esc>", opts) -- insert line above

-- INSERT MODE
-- Press fast to exit insert mode
keymap("i", "kj", "<ESC>", opts)

-- VISUAL MODE
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
-- paste text in visual block
keymap("v", "p", '"_dP', opts)
-- Do not yank with x
keymap("v", "x", '"_x', opts)

-- VISUAL BLOCK --
-- Do not yank with x
keymap("x", "x", '"_x', opts)
