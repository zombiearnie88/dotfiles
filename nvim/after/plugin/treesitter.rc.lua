local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
	-- print('no treesitter')
	return
end

ts.setup({
	highlight = {
		enable = true,
		disable = { "tsx", "jsx" },
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"tsx",
		"javascript",
		"typescript",
		"lua",
		"json",
		"css",
		"toml",
		"fish",
		"yaml",
		"html",
		"python",
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	context_commentstring = {
		enable = true,
	},
})

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
