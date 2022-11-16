require("base")
require("highlights")
require("maps")
require("plugins")

local has = function(x)
	return vim.fn.has(x) == 1
end

local is_mac = has("macunix")

if is_mac then
	require("macos")
else
	require("windows")
end

-- set default colorscheme
local status, _ = pcall(require, "kanagawa")
if status then
	vim.cmd("colorscheme kanagawa")
end
