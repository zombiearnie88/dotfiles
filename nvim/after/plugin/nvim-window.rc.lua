local status, window = pcall(require, "nvim-window")
if not status then
	return
end

vim.keymap.set("", "<leader>q", function()
	window.pick()
end)
