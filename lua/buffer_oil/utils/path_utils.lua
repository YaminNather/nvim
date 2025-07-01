local m = {}

function m.full_file_name_from_path(path)
	file_name = ""
	for match in path:gmatch("([^\\]+)") do
		file_name = match
		print(match)
	end

	return file_name
end

function m.split_full_file_name(file_name)
	matches = string.gmatch(file_name, "([^\\.]+)")
	file_name = matches()
	extension = matches()

	return file_name, extension
end

return m
