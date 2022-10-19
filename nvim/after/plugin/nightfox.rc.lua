local status, nightfox = pcall(require, "nightfox")
if not status then
	return
end

nightfox.setup({
	options = {
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = true,
			search = false,
		},
	},
})
