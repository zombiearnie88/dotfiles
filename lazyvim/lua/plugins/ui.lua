return {
  -- noice
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        format = {
          cmdline = { icon = "󰘳" },
          search_down = { icon = " ⌄" },
          search_up = { icon = " ⌃" },
          filter = { icon = "$" },
          lua = { icon = "☾" },
          help = { icon = "?" },
        },
      }, -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        -- command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false, -- enables an input dialog for inc-rename.nvim
        -- lsp_doc_border = false, -- add a border to hover docs and signature help
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
  -- logo
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
}
