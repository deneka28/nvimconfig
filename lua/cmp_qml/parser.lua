local M = {}

---@class QmlImportContext
---@field valid boolean
---@field quote string?
---@field relative string?
---@field prefix string?
---@field directory string?

local function split_path(path)
	local dir = path:match("^(.*[/\\])")
	local prefix = path:match("([^/\\]*)$")

	return dir or "", prefix or ""
end

---Разобрать строку import
---@param line string
---@return QmlImportContext
function M.parse(line)
	local quote, path = line:match([[import%s+(['"])([^'"]*)$]])

	if not quote then
		return {
			valid = false,
		}
	end

	local directory, prefix = split_path(path)

	return {
		valid = true,
		quote = quote,
		relative = path,
		directory = directory,
		prefix = prefix,
	}
end

return M
