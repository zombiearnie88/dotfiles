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
keymap("n", "cl", ":noh<cr>", opts)

-- INSERT MODE
-- Press fast to exit insert mode
keymap("i", "kj", "<ESC>", opts)

-- VISUAL MODE
-- Do not yank with x
keymap("v", "x", '"_x', opts)

-- VISUAL BLOCK --
-- Do not yank with x
keymap("x", "x", '"_x', opts)
