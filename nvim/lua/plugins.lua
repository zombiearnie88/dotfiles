local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Color scheme
	-- use({
	-- 	"svrana/neosolarized.nvim",
	-- 	requires = { "tjdevries/colorbuddy.nvim" },
	-- })plug
	--
	use("rebelot/kanagawa.nvim")
	-- use("folke/tokyonight.nvim")
	-- use("marko-cerovac/material.nvim")
	-- use("rmehri01/onenord.nvim")
	-- use("Shatur/neovim-ayu")
	-- use("drewtempelmeyer/palenight.vim")
	-- use("sainnhe/edge")
	-- use("sainnhe/sonokai")
	-- use("sainnhe/gruvbox-material")
	-- use("sainnhe/everforest")
	use("morhetz/gruvbox")
	use("EdenEast/nightfox.nvim")
	use("projekt0n/github-nvim-theme")

	-- Enhance Nvim
	use("kyazdani42/nvim-web-devicons") -- File icons
	use("kyazdani42/nvim-tree.lua") -- Sidebar File Explorer
	use("goolord/alpha-nvim") -- Start screen

	-- Tabline
	-- use("akinsho/bufferline.nvim")
	use("kdheepak/tabline.nvim")

	-- Status line
	use("hoob3rt/lualine.nvim")

	-- Editting Support
	use("famiu/bufdelete.nvim") -- delete buffer without losing layout
	use("gbprod/yanky.nvim") -- yank ring, yank history picker
	use({
		"abecodes/tabout.nvim",
	}) -- jump out of parentheses, quotes
	use("AckslD/swenv.nvim") -- switch python virtual environments

	-- Marks
	use("chentoast/marks.nvim") -- interacting and manipulating Vim marks

	-- Editor
	use("Pocco81/true-zen.nvim") -- zen mode, distraction free

	-- Snippet
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets") -- a bunch of friendly-snippets ready to use

	-- Completion
	use("hrsh7th/nvim-cmp") -- Completion
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use("saadparwaiz1/cmp_luasnip") -- snippet Completion

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("glepnir/lspsaga.nvim") -- LSP UIs
	use("folke/lsp-colors.nvim") -- ass missing LSP diagnostics highlight group
	use("williamboman/mason.nvim") -- Language server installer
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	use("jose-elias-alvarez/typescript.nvim") -- Minimal Typescript LSP
	use("simrat39/symbols-outline.nvim") -- Symbol outline

	-- formatter and linter
	use("ckipp01/stylua-nvim") -- Stylua

	-- Syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-context") -- sticky context
	use("windwp/nvim-autopairs") -- auto pairs
	use("windwp/nvim-ts-autotag") -- auto tag
	use("p00f/nvim-ts-rainbow") -- rainbow
	use("kylechui/nvim-surround") -- add/change/delete surrounding delimiter pairs

	-- Cursor line
	-- use("RRethy/vim-illuminate") -- highlight selected text

	-- Indent
	use("lukas-reineke/indent-blankline.nvim")

	-- Smooth scroll
	-- use("declancm/cinnamon.nvim")
	-- use("karb94/neoscroll.nvim")

	-- Motion
	use("phaazon/hop.nvim") -- jump anywhere in a document

	-- code comment
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- code fold
	use({
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
	})

	-- Teelescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-ui-select.nvim") -- replace vim native ui select
	use("folke/trouble.nvim") -- showing diagnostics, references, telescope results, quickfix and location lists

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("dinhhuy258/git.nvim")

	-- Json schema provider
	use("b0o/schemastore.nvim")

	-- Toggle Terminal
	use("akinsho/toggleterm.nvim")

	-- Tmux integration
	use("aserowy/tmux.nvim")

	-- Split and window
	use("https://gitlab.com/yorickpeterse/nvim-window.git") -- easily jump between windows

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
