local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local show_in_width = function()
	return vim.fn.winwidth(0) < 80
end

-- local function bufflerLabel()
-- 	return [[Buffers]]
-- end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

local filename = {
	"filename",
	file_status = true, -- displays file status
	path = 0, -- just filename
	cond = hide_in_width,
}

local nvimTreeType = {
	"filetype",
	cond = show_in_width,
}

local filetype = {
	"filetype",
	cond = hide_in_width,
}

local branch = {
	"branch",
	cond = hide_in_width,
}

local encoding = {
	"encoding",
	cond = hide_in_width,
}

local mode = {
	"mode",
	cond = hide_in_width,
}

local progress = {
	"progress",
	cond = hide_in_width,
}

local location = {
	"location",
	cond = hide_in_width,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = {
			filename,
			nvimTreeType,
			diagnostics,
		},
		lualine_x = {
			encoding,
			filetype,
		},
		lualine_y = { progress },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { branch },
		lualine_c = { filename, nvimTreeType },
		lualine_x = { location },
		lualine_y = {},
		lualine_z = {},
	},
	-- tabline = {
	-- 	lualine_a = {},
	-- 	lualine_b = {},
	-- 	lualine_c = { require("tabline").tabline_buffers },
	-- 	lualine_x = {},
	-- 	lualine_y = {},
	-- 	lualine_z = { bufflerLabel },
	-- },
	tabline = {},
	extensions = {},
})
