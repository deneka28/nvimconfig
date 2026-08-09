local M = {}

---@param path string
---@return table|nil
function M.parse(path)
	local file = io.open(path .. "/qmldir", "r")

	if not file then
		return nil
	end

	local module = nil
	local components = {}

	for line in file:lines() do
		line = vim.trim(line)

		if line == "" then
			goto continue
		end

		if vim.startswith(line, "#") then
			goto continue
		end

		local name = line:match("^module%s+(.+)$")

		if name then
			module = vim.trim(name)
			goto continue
		end

		local singleton, comp, version, filename = line:match("^(singleton)%s+(%S+)%s+(%S+)%s+(%S+)$")

		if singleton then
			components[comp] = {
				version = version,
				file = filename,
				singleton = true,
			}

			goto continue
		end

		comp, version, filename = line:match("^(%S+)%s+(%S+)%s+(%S+)$")

		if comp then
			components[comp] = {
				version = version,
				file = filename,
				singleton = false,
			}
		end

		::continue::
	end

	file:close()

	return {
		module = module,
		components = components,
	}
end

return M
