local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
	-- print(client.name)
	-- all formatting done by null-ls

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- LSP telescope related
	keymap("n", "go", function()
		builtin.lsp_document_symbols() -- list outline symbols
	end)

	keymap("n", "gi", function()
		builtin.lsp_implementations()
	end)

	keymap("n", "gd", function()
		builtin.lsp_definitions()
	end)

	-- LSP Saga related
	-- Code action
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
	keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

	-- LSP Finder
	-- Lsp finder find the symbol definition implement reference
	-- when you use action in finder like open vsplit then you can
	-- use <C-t> to jump back
	keymap("n", "gf", "<cmd>Lspsaga finder<CR>", { silent = true })

	-- Rename
	keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
	-- keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })

	-- Peek Definition
	-- you can edit the definition file in this flaotwindow
	-- also support open/vsplit/etc operation check definition_action_keys
	-- support tagstack C-t jump back
	keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

	-- Show line diagnostics
	keymap("n", "sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })

	-- Show cursor diagnostic
	keymap("n", "sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

	-- Show buffer diagnostics
	keymap("n", "sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

	-- Diagnsotic jump can use `<c-o>` to jump back
	keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true })
	keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true })

	-- Only jump to error
	keymap("n", "[E", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })
	keymap("n", "]E", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { silent = true })

	-- Show Outline
	keymap("n", "<leader>so", "<cmd>LSoutlineToggle<CR>", { silent = true })

	-- Hover Doc
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

	-- Call hierarchy
	keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
	keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

-- protocol.CompletionItemKind = {
-- 	"", -- Text
-- 	"", -- Method
-- 	"", -- Function
-- 	"", -- Constructor
-- 	"", -- Field
-- 	"", -- Variable
-- 	"", -- Class
-- 	"ﰮ", -- Interface
-- 	"", -- Module
-- 	"", -- Property
-- 	"", -- Unit
-- 	"", -- Value
-- 	"", -- Enum
-- 	"", -- Keyword
-- 	"﬌", -- Snippet
-- 	"", -- Color
-- 	"", -- File
-- 	"", -- Reference
-- 	"", -- Folder
-- 	"", -- EnumMember
-- 	"", -- Constant
-- 	"", -- Struct
-- 	"", -- Event
-- 	"ﬦ", -- Operator
-- 	"", -- TypeParameter
-- }

local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable code folding based on LSP
M.capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Set up completion using nvim_cmp with LSP source
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities) -- for nvim-cmp

-- SERVER SETUPs
-- Typescript language setup
-- nvim_lsp.tsserver.setup({
-- 	on_attach = on_attach,
-- 	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
-- 	cmd = { "typescript-language-server", "--stdio" },
-- 	capabilities = M.capabilities,
-- })
--
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
nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
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
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
