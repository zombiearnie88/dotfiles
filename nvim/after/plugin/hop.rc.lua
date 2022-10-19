local status, hop = pcall(require, "hop")
if not status then
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})

local hint = require("hop.hint")

-- Mapping
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- reimplement f
-- keymap.set("", "f", ":HopChar1CurrentLineAC<cr>", opts)

-- reimplement F
-- keymap.set("", "F", ":HopChar1CurrentLineBC<cr>")

-- reimplement thop
-- keymap.set("", "t", function()
-- 	hop.hint_char1({
-- 		direction = hint.HintDirection.AFTER_CURSOR,
-- 		current_line_only = true,
-- 		hint_offset = -1,
-- 	})
-- end)

-- reimplement T
-- keymap.set("", "T", function()
-- 	hop.hint_char1({
-- 		direction = hint.HintDirection.BEFORE_CURSOR,
-- 		current_line_only = true,
-- 		hint_offset = -1,
-- 	})
-- end)

-- Hop Char1 Current Line
keymap.set("", "<leader><leader>f", ":HopChar1CurrentLine<cr>", opts)

-- Hop Pattern
keymap.set("", "<leader>/", ":HopPattern<cr>", opts)

-- Hop word in current line
keymap.set("", "<leader>w", ":HopWordCurrentLine<cr>", opts)

-- Hop Lines
keymap.set("", "<leader>j", ":HopLineStartAC<cr>", opts)
keymap.set("", "<leader>k", ":HopLineStartBC<cr>", opts)

-- Hop 2 chars
keymap.set("", "<leader>s", ":HopChar2<cr>", opts)
