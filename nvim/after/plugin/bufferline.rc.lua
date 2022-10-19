local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "thin",
		show_tab_indicators = true,
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon",
		},
		modified_icon = "●",
		left_trunc_marker = "",
		right_trunc_marker = "",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
	},
	-- highlights = {
	-- 	separator = {
	-- 		fg = "#073642",
	-- 		bg = "#002b36",
	-- 	},
	-- 	separator_selected = {
	-- 		fg = "#073642",
	-- 	},
	-- 	background = {
	-- 		fg = "#657b83",
	-- 		bg = "#002b36",
	-- 	},
	-- 	buffer_selected = {
	-- 		fg = "#fdf6e3",
	-- 		bold = true,
	-- 	},
	-- 	fill = {
	-- 		bg = "#191B20",
	-- 	},
	-- },
})

vim.keymap.set("n", "≥", "<Cmd>BufferLineCycleNext<CR>", {}) -- Alt+>
vim.keymap.set("n", "≤", "<Cmd>BufferLineCyclePrev<CR>", {}) -- Alt+<
