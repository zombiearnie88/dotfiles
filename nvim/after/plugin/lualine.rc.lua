local status, lualine = pcall(require, "lualine")
if not status then
	return
end

local nvimTreeWidth = 32

local function bufflerLabel()
	return [[Buffers]]
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " ", hint = " " },
}

local filename = {
	"filename",
	file_status = true, -- displays file status
	path = 0, -- just filename
	cond = function()
		return vim.fn.winwidth(0) > nvimTreeWidth
	end,
}

local nvimTreeType = {
	"filetype",
	cond = function()
		return vim.fn.winwidth(0) < nvimTreeWidth
	end,
}

local filetype = {
	"filetype",
	cond = function()
		return vim.fn.winwidth(0) > nvimTreeWidth
	end,
}

local branch = {
	"branch",
	cond = function()
		return vim.fn.winwidth(0) > nvimTreeWidth
	end,
}

local encoding = {
	"encoding",
	cond = function()
		return vim.fn.winwidth(0) > nvimTreeWidth
	end,
}

local mode = {
	"mode",
	cond = function()
		return vim.fn.winwidth(0) > nvimTreeWidth
	end,
}

local progress = {
	"progress",
	cond = function()
		return vim.fn.winwidth(0) > nvimTreeWidth
	end,
}

local location = {
	"location",
	cond = function()
		return vim.fn.winwidth(0) > nvimTreeWidth
	end,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "Outline" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch },
		lualine_c = {
			nvimTreeType,
			filename,
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
		lualine_c = { nvimTreeType, filename },
		lualine_x = { location },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { require("tabline").tabline_buffers },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { bufflerLabel },
	},
	extensions = {},
})
