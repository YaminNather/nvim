local m = {}

local bufdelete = require('bufdelete')
local ordered_buffers = require("ordered_buffers")
local devicons = require('nvim-web-devicons')
local path_utils = require('buffer_oil.utils.path_utils')

local is_open = false
local explorer_buffer = -1
local explorer_window = -1
local window_to_change = -1

local extmark_namespace = -1

local last_buffer_content = {}

function m:open()
	if is_open then
		return
	end

	window_to_change = vim.api.nvim_get_current_win()

	explorer_buffer = vim.api.nvim_create_buf(false, true)
	vim.bo[explorer_buffer].buftype = ""
	-- vim.bo[explorer_buffer].bufhidden = "hide"
	-- vim.bo[explorer_buffer].swapfile = false
	-- vim.bo[explorer_buffer].modifiable = true
	-- vim.bo[explorer_buffer].readonly = false
	vim.api.nvim_buf_set_name(explorer_buffer, "buffer_oil://explorer")

	local ui = vim.api.nvim_list_uis()[1]

	local width = ui.width - 32
	local height = ui.height - 8

	local row = (ui.height - height) / 2
	local column = (ui.width - width) / 2

	explorer_window = vim.api.nvim_open_win(explorer_buffer, true, {
		relative = 'editor',
		width = width,
		height = height,
		row = row,
		col = column,
		style = 'minimal',
		border = 'rounded',
	})

	extmark_namespace = vim.api.nvim_create_namespace("extmark_namespace")
	update_buffer_list()

	vim.api.nvim_create_autocmd('BufWriteCmd', {
		buffer = explorer_buffer,
		callback = function(args)
			local lines = vim.api.nvim_buf_get_lines(explorer_buffer, 0, -1, false)
			local buffers = {}
			local actual_buffers = vim.api.nvim_list_bufs()
			local keep_buffer_alive = {}
			for i, actual_buffer in pairs(actual_buffers) do
				keep_buffer_alive[actual_buffer] = false
			end
			local invalid_format = false
			for i=1,#lines do
				print(lines[i])

				if lines[i]:match("^%s*$") ~= nil then
					goto continue
				end

				local buffer_id = tonumber(string.match(lines[i], '%S+'))
				if buffer_id == nil then
					invalid_format = true
					break
				end
				table.insert(buffers, buffer_id)
				keep_buffer_alive[buffer_id] = true

				::continue::
			end

			if invalid_format then
				print("invalid oil_buffer format, reverting")
				update_buffer_list()
				return
			end

			if #buffers < #vim.api.nvim_list_bufs() then
				print("CustomLog: deleting buffers")

				for i, buffer in pairs(actual_buffers) do
					if not vim.api.nvim_buf_get_option(buffer, "buflisted") then
						goto continue
					end

					if not keep_buffer_alive[buffer] then
						-- if vim.api.nvim_create_buf(false, true) then
						-- end

						print("CustomLog: deleting buffer " .. buffer)
						-- vim.api.nvim_buf_delete(buffer, { force = true })
						bufdelete.bufdelete(buffer, true)
					end
					
					::continue::
				end
			end

			ordered_buffers.reorder_all_buffers(buffers)
			update_buffer_list()
		end,
	})

	-- vim.keymap.set(
	-- 	'n', ':w<CR>',
	-- 	function()
	-- 		print('CustomLog: saved')
	-- 	end,
	-- 	{buffer = explorer_buffer}
	-- )

	vim.keymap.set(
		'n',
		'<CR>',
		function()
			local destination_buffer = tonumber(string.match(vim.api.nvim_get_current_line(), '%S+'))
			if destination_buffer == nil then
				print("invalid line")
				return
			end

			if not vim.api.nvim_buf_is_valid(destination_buffer) then
				print("buffer is missing, refreshing")
				update_buffer_list()
				return
			end

			m.close()

			vim.api.nvim_set_current_buf(destination_buffer)
		end,
		{buffer = explorer_buffer}
	)

	vim.api.nvim_create_autocmd('BufWipeout', {
		buffer = explorer_buffer,
		callback = function(args)
			m.close()
		end
	})

	vim.api.nvim_create_autocmd('WinClosed', {
		pattern = explorer_window .. "",
		callback = function(args)
			m.close()
		end,
	})

	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
		buffer = 0,
		callback = function()
			local min_col = 7
			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
			if col < min_col then
				vim.api.nvim_win_set_cursor(0, { row, min_col })
			end
		end
	})

	vim.api.nvim_create_autocmd("TextChanged", {
		buffer = 0,
		callback = function()
			local row, column = vim.api.nvim_win_get_cursor(0)
			local line_content = vim.api.nvim_buf_get_line(0, row, row + 1, true)
			if is_valid_line(line_content) then

			end


			line_content = vim.api.nvim_buf_get_lines(0, 0, -1 ,false)
		end
	})

	is_open = true
end

function update_buffer_list()
	local buffers = ordered_buffers.get_buffers()

	for i, buffer in pairs(buffers) do
		local line_content = tostring(buffer)

		local buffer_name = vim.api.nvim_buf_get_name(buffer)
		full_file_name = path_utils.full_file_name_from_path(buffer_name)
		file_name, extension = path_utils.split_full_file_name(full_file_name)
		line_content = line_content .. ' ' .. devicons.get_icon(file_name, extension)

		if buffer_name ~= '' then
			line_content = line_content .. '  ' .. buffer_name
		else
			line_content = line_content .. '  [No Name]' 
		end

		vim.api.nvim_buf_set_lines(explorer_buffer, i - 1, i, false, { line_content })

		
		-- local buffer_name = vim.api.nvim_buf_get_name(buffer)
		-- local line_content = buffer_name
		-- vim.api.nvim_buf_set_lines(explorer_buffer, i - 1, i, false, { line_content })
		--
		-- vim.api.nvim_buf_set_extmark(explorer_buffer, extmark_namespace, i - 1, line_content:len(), {
		-- 	virt_text = {
		-- 		{ "  +", nil },
		-- 	},
		-- 	virt_text_pos = 'inline',
		-- })
		--
		-- full_file_name = path_utils.full_file_name_from_path(buffer_name)
		-- file_name, extension = path_utils.split_full_file_name(full_file_name)
		-- vim.api.nvim_buf_set_extmark(explorer_buffer, extmark_namespace, i - 1, 0, {
		-- 	virt_text = {
		-- 		{ string.format('%s  %s  ', devicons.get_icon(file_name, extension), buffer), nil },
		-- 	},
		-- 	virt_text_pos = 'inline',
		-- })
	end

	line_count = vim.api.nvim_buf_line_count(explorer_buffer)
	if #buffers < line_count then
		vim.api.nvim_buf_set_lines(explorer_buffer, #buffers, line_count, false, {})
	end
end

function m:close()
	if not is_open then
		return
	end

	if vim.api.nvim_win_is_valid(explorer_window) then
		vim.api.nvim_buf_delete(explorer_buffer, {force = true})
	end

	explorer_buffer = -1
	explorer_window = -1
	is_open = false 
end

function is_valid_line()

end

return m
