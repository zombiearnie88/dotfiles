-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- reload nvim
-- keymap("n", "<leader>r", ":source $MYVIMRC<cr>", {})

-- Moving line up and down in normal, visual, visual-block mode with <A-j>, <A-k>
-- keymap("n", "∆", ":m .+1<return>", opts)
-- keymap("n", "˚", ":m .-2<return>", opts)
-- keymap("n", "<A-j>", ":m .+1<return>", opts)
-- keymap("n", "<A-k>", ":m .-2<return>", opts)
--
-- keymap("v", "∆", ":m .+1<CR>==", opts)
-- keymap("v", "˚", ":m .-2<CR>==", opts)
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
--
-- keymap("x", "∆", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "˚", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
--
-- keymap("i", "∆", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("i", "˚", "<Esc>:m .-2<CR>==gi", opts)
-- keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Save file
keymap("", "ß", ":w<cr>", opts) -- Alt-S Save file
keymap("", "<A-S>", ":w<cr>", opts) -- Alt-S Save file

-- Close file
keymap("", "œ", ":w<cr>", opts) -- Alt-q
keymap("", "<A-q>", ":q<cr>", opts) -- Alt-q

-- NORMAL MODE --
-- New tab
keymap("n", "<leader>t", ":tabedit<Return>", { silent = true })

-- Split Window
keymap("n", "sh", ":split<Return><C-w>w", { silent = true })
keymap("n", "sv", ":vsplit<Return><C-w>w", { silent = true })

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize window with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<C-l>", ":bnext<CR>", opts)
-- keymap("n", "<C-h>", ":bprevious<CR>", opts)

-- Do not yank with x
keymap("n", "x", '"_x', opts)

-- insert line in normal mode
keymap("n", "<leader>o", "o<Esc>", opts) -- insert line below
keymap("n", "<leader>O", "O<Esc>", opts) -- insert line above

-- clear highlight
keymap("n", "L", ":noh<cr>", opts)

-- INSERT MODE
-- Press fast to exit insert mode
keymap("i", "kj", "<ESC>", opts)

-- VISUAL MODE --
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
