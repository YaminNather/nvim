local m = {}

local ordered_buffers = require("ordered_buffers")
local window = require("buffer_oil.window")

local is_open = false
local explorer_buffer = -1
local explorer_window = -1

function m.setup()
	ordered_buffers.setup()

	vim.keymap.set('n', '<Leader>bo', window.open, { desc = 'Open Buffer Oil explorer' })
	vim.keymap.set('n', '<Leader>bc', window.close, { desc = 'Close Buffer Oil explorer' })
end

return m
