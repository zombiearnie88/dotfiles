return {
  -- config tsserver
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      -- init = function()
      --   require("lazyvim.util").lsp.on_attach(function(_, buffer)
      --     -- stylua: ignore
      --     -- vim.keymap.set("n", "<leader>ci", function() require("typescript").actions.addMissingImports() end, { buffer = buffer, desc = "Add Missing Imports" })
      --     -- vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "TRename File", buffer = buffer })
      --   end)
      -- end,
    },
    opts = {
      -- make sure mason installs the server
      -- LSP Settings
      servers = {
        ---@type lspconfig.options.tsserver
        tsserver = {
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>cR",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove Unused Imports",
            },
          },
          ---@diagnostic disable-next-line: missing-fields
          settings = {
            completions = {
              completeFunctionCalls = true,
            },
          },
        },
      },
      -- additional LSP setups
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({
            server = opts,
          })
          return true
        end,
      },
    },
  },
}
