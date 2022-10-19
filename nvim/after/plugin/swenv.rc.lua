local status, swenv = pcall(require, "swenv")
if not status then
	return
end

swenv.setup({
	venvs_path = vim.fn.expand("~/.local/share/virtualenvs"),
})

vim.keymap.set("n", "<leader>e", function()
	-- swenv.api.pick_venv()
	require("swenv.api").pick_venv()
end)
