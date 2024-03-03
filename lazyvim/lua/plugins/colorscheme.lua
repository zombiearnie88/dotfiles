return {
  -- add kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      compile = false, -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- do not set background color
      dimInactive = false, -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none", -- remove gutter background
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- transparent floating windows
          -- NormalFloat = { bg = "none" },
          -- FloatBorder = { bg = "none" },
          -- FloatTitle = { bg = "none" },
          --
          -- -- Save an hlgroup with dark background and dimmed foreground
          -- -- so that you can use it where your still want darker windows.
          -- -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
          -- NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          --
          -- -- Popular plugins that open floats will link to NormalFloat by default;
          -- -- set their background accordingly if you wish to keep them dark and borderless
          -- LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          -- MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- Dark completion Popup window
          -- PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          -- Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          -- PmenuSbar = { bg = theme.ui.bg_m1 },
          -- PmenuThumb = { bg = theme.ui.bg_p2 },
          -- PmenuPromptNormal = { bg = theme.ui.bg_p2 },

          -- borderless Telescope window
          TelescopeBorder = { fg = theme.ui.float.fg_border, bg = "none" },
          -- TelescopeTitle = { fg = theme.ui.special, bold = true },
          -- TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          -- TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          -- TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          -- TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          -- TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          -- TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          -- TelescopeResultsBorder = { bg_gutter = "none" },
        }
      end,
    },
  },

  -- add Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      transparent_background = true,
    },
  },
  -- add Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "moon" },
  },

  -- Configure LazyVim to load kanagawa
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
