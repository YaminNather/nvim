local m  = {}

m.OS = {
	windows = 0,
	linux = 1,
	macos = 2,
}

function m.os()
	if vim.loop.os_uname().sysname:lower():match('windows') then
		return m.OS.windows
	else
		return m.OS.linux
	end
end

return m
