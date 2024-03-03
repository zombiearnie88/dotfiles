return {
  -- INC-RENAME
  {
    "smjonas/inc-rename.nvim",
    enabled = false,
    cmd = "IncRename",
    config = true,
  },
  -- end rename

  -- COMMENT
  {
    "echasnovski/mini.comment",
    enabled = false,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
  -- end comment
  --
  -- INDENT
  {
    "echasnovski/mini.indentscope",
    opts = {
      -- symbol = "▏",
      symbol = "┊",
      options = { try_as_border = true },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      indent = {
        char = "┊",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },
  -- end Indent

  -- LSP, BUFFER, PATH completion source
  { "onsails/lspkind-nvim" },
  -- Disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "saadparwaiz1/cmp_luasnip",
    },
    keys = function()
      return {}
    end,
  },
  -- Load friendly snippets
  {
    "rafamadriz/friendly-snippets",
    config = function()
      local loader = require("luasnip.loaders.from_vscode")
      loader.lazy_load()
      loader.load({ paths = { "./snippets" } })
    end,
  },
  -- Setup CMP
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local lspkind = require("lspkind")
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      }

      opts.sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      table.insert(opts.formatting, {
        format = lspkind.cmp_format({
          with_text = false,
          maxwidth = 50,
          before = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            })[entry.source.name]

            return vim_item
          end,
        }),
      })
    end,
  },
  -- end snippet
}
