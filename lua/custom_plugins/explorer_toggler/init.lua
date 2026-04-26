local m = {}

local registered = {}
local current = 1

---Setup
function m.setup()
	vim.keymap.set("n", "<Leader>E", m.switch, { noremap = true, silent = true, desc = "Switch to the next file explorer" })
end

---Register a file explorer.
---@param register function A function that to setup the file explorer when switched to.
---@param unregister function A function to clear the file explorer when switched off off.
function m.register_explorer(register, unregister)
	table.insert(registered, {register = register, unregister = unregister})

	if #registered == 1 then
		register()
	end
end

---Switches to next file explorer.
function m.switch()
	registered[current].unregister()
	current = (current % #registered) + 1
	print("Switching to " .. current)
	registered[current].register()
end

return m
