return {
  -- Noice
  {
    "folke/noice.nvim",
    opts = {
      -- skip "No information available"
      routes = {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
      cmdline = {
        format = {
          cmdline = { icon = " 󰘳  " },
          search_down = { icon = " " },
          search_up = { icon = " " },
          filter = { icon = "$" },
          lua = { icon = "☾" },
          help = { icon = "?" },
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      -- format = {
      --   level = {
      --     icons = {
      --       error = "✖",
      --       warn = "▼",
      --       info = "●",
      --     },
      --   },
      -- },
      -- popupmenu = {
      --   kind_icons = false,
      -- },
      -- inc_rename = {
      --   cmdline = {
      --     format = {
      --       IncRename = { icon = "⟳" },
      --     },
      --   },
      -- },
    },
  },
  -- Logo
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[

███████╗ ██████╗ ███╗   ███╗██████╗ ██╗███████╗
╚══███╔╝██╔═══██╗████╗ ████║██╔══██╗██║██╔════╝
  ███╔╝ ██║   ██║██╔████╔██║██████╔╝██║█████╗  
 ███╔╝  ██║   ██║██║╚██╔╝██║██╔══██╗██║██╔══╝  
███████╗╚██████╔╝██║ ╚═╝ ██║██████╔╝██║███████╗
╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚═╝╚══════╝

    ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  -- floating status line
  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup()
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
