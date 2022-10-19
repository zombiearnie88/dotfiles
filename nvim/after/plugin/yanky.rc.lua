local status, yanky = pcall(require, "yanky")
if not status then
	return
end

yanky.setup({})

local status_2, telescope = pcall(require, "telescope")
if not status_2 then
	return
end

telescope.load_extension("yank_history")

vim.keymap.set("n", "fy", function()
	telescope.extensions.yank_history.yank_history({})
end)
