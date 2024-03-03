-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.listchars = {
  tab = "> ",
  trail = " ",
  nbsp = "+",
}
-- sync clipboard
-- vim.opt.clipboard:append({ "unnamedplus" })

local options = {
  backup = false, -- creates a backup file
  -- clipboard = "unnamedplus",            -- allows neovim to access the system clipboard
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "a", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  swapfile = false, -- creates a swapfile
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  -- expandtab = true, -- convert tabs to spaces
  -- shiftwidth = 2, -- the number of spaces inserted for each indentation
  -- tabstop = 2, -- insert 2 spaces for a tab

  scrolloff = 10, -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 10, -- minimal number of screen columns either side of cursor if wrap is `false`
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  -- whichwrap = "bs<>[]hl", -- which "horizontal" keys are allowed to travel to prev/next line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})
