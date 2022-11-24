local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	print(client.name)
	-- all formatting done by null-ls

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

local M = {}
-- Set up completion using nvim_cmp with LSP source
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities) -- for nvim-cmp

-- Enable code folding based on LSP
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- SERVER SETUPs
-- Typescript language setup
-- nvim_lsp.tsserver.setup({
-- 	on_attach = on_attach,
-- 	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
-- 	cmd = { "typescript-language-server", "--stdio" },
-- 	capabilities = M.capabilities,
-- })
require("typescript").setup({
	disable_commands = false, -- prevent the plugin from creating Vim commands
	debug = false, -- enable debug logging for commands
	go_to_source_definition = {
		fallback = true, -- fall back to standard LSP definition on failure
	},
	server = { -- pass options to lspconfig's setup method
		on_attach = on_attach,
		capabilities = M.capabilities,
	},
})

-- Lua language setup
nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

-- JSON language setup
nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = M.capabilities,
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

-- Python LSP setup
nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = M.capabilities,
	settings = {
		python = {
			venvPath = "~/.local/share/virtualenvs",
			analysis = {
				typeCheckingMode = "off",
			},
		},
	},
})
-- nvim_lsp.pylsp.setup({
-- 	on_attach = on_attach,
-- 	capabilities = M.capabilities,
-- 	settings = {
-- 		pylsp = {
-- 			plugins = {
-- 				pyflakes = {
-- 					enabled = false, -- we use flake8 instead
-- 				},
-- 				pycodestyle = {
-- 					enabled = false, -- we use flake8, black instead
-- 					ignore = { "W391" },
-- 					maxLineLength = 100,
-- 				},
-- 			},
-- 		},
-- 	},
-- })

-- Prisma
-- nvim_lsp.prismals.setup({})

-- DIAGNOSTIC
-- public diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = false,
	-- virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

vim.diagnostic.config({
	-- virtual_text = {
	-- 	prefix = "●",
	-- },
	virtual_text = false,
	update_in_insert = false,
	float = {
		source = "always", -- Or "if_many"
	},
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
