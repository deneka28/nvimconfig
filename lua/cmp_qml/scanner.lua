local uv = vim.uv or vim.loop

local M = {}

local ignored = {
	[".git"] = true,
	[".cache"] = true,
	["node_modules"] = true,
	["build"] = true,
	["dist"] = true,
	["target"] = true,
	["__pycache__"] = true,
}

function M.scan(path)
	local handle = uv.fs_scandir(path)

	if not handle then
		return {
			entries = {},
			has_qmldir = false,
			has_qml = false,
		}
	end

	local result = {
		entries = {},
		has_qmldir = false,
		has_qml = false,
	}

	while true do
		local name, typ = uv.fs_scandir_next(handle)

		if not name then
			break
		end

		if typ == "file" then
			if name == "qmldir" then
				result.has_qmldir = true
			end

			if name:sub(-4) == ".qml" then
				result.has_qml = true
			end
		elseif typ == "directory" then
			if not ignored[name] then
				table.insert(result.entries, {
					name = name,
					path = path .. "/" .. name,
					type = "directory",
				})
			end
		end
	end

	table.sort(result.entries, function(a, b)
		return a.name < b.name
	end)

	return result
end

return M
