local m = {}

local registered = {}
local current = 1

---Setup
function m.setup()
	table.sort(registered, function(a, b)
		return a.priority < b.priority
	end)

	-- print("[explorer_toggler] registered count = " .. #registered)
	if #registered > 0 then
		registered[1].register()
	end

	vim.keymap.set("n", "<Leader>E", m.switch, { noremap = true, silent = true, desc = "Switch to the next file explorer" })
end

---Register a file explorer.
---@param id string To setup the file explorer when switched to.
---@param priority integer To clear the file explorer when switched off off.
---@param register function To setup the file explorer when switched to.
---@param unregister function To clear the file explorer when switched off off.
function m.register_explorer(id, priority, register, unregister)
	-- print("[explorer_toggler] Registering explorer " .. id .. " with priority " .. priority )
	table.insert(registered, {id = id, priority = priority, register = register, unregister = unregister})
end

---Switches to next file explorer.
function m.switch()
	registered[current].unregister()
	current = (current % #registered) + 1
	print("Switching to " .. current)
	registered[current].register()
end

return m
