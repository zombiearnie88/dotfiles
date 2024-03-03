return {
  -- Disable flash in search "/ or ?"
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        search = {
          enabled = false,
          highlight = { backdrop = true },
        },
      },
    },
  },

  -- list LSP symbol
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>ss",
        false,
      },
      {
        "<leader>ss",
        function()
          require("telescope.builtin").lsp_document_symbols()
        end,
        desc = "Goto Document Symbols",
      },
    },
  },

  -- NeoTree focus
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>se", "<cmd>Neotree focus<cr>", desc = "Neotree Focus" },
    },
  },
}
