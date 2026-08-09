local uv = vim.uv or vim.loop
local scanner = require("cmp_qml.scanner")

local M = {}

local cache = {}

---@param path string
---@return table
function M.get(path)
	local stat = uv.fs_stat(path)

	if not stat then
		return {
			entries = {},
			has_qmldir = false,
			has_qml = false,
		}
	end

	local cached = cache[path]

	-- Если время изменения каталога не изменилось — возвращаем кеш.
	if cached and cached.mtime.sec == stat.mtime.sec and cached.mtime.nsec == stat.mtime.nsec then
		return cached.data
	end

	local data = scanner.scan(path)

	cache[path] = {
		mtime = stat.mtime,
		data = data,
	}

	return data
end

function M.clear()
	cache = {}
end

function M.invalidate(path)
	cache[path] = nil
end

return M
