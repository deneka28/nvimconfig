local cmp = require("cmp")
local uv = vim.uv or vim.loop

local source = {}

local ignored = {
	[".git"] = true,
	[".cache"] = true,
	["node_modules"] = true,
	["__pycache__"] = true,
}

function source.new()
	return setmetatable({}, { __index = source })
end

function source:is_available()
	return vim.bo.filetype == "qml"
end

function source:get_trigger_characters()
	return { "/", ".", '"', "'" }
end

function source:complete(params, callback)
	local line = params.context.cursor_before_line

	-- import "./"
	-- import "../"
	-- import "../../Widgets/Com"
	local rel = line:match([[import%s+["']([^"']*)$]])

	if not rel then
		callback({ items = {}, isIncomplete = false })
		return
	end

	local base = vim.fn.expand("%:p:h")

	local parent = rel:match("^(.*[/\\])") or ""
	local prefix = rel:match("([^/\\]*)$") or ""

	local dir = vim.fs.normalize(base .. "/" .. parent)

	local scan = uv.fs_scandir(dir)

	if not scan then
		callback({ items = {}, isIncomplete = false })
		return
	end

	local items = {}

	while true do
		local name, typ = uv.fs_scandir_next(scan)

		if not name then
			break
		end

		if typ == "directory" and not ignored[name] and vim.startswith(name:lower(), prefix:lower()) then
			table.insert(items, {
				label = name .. "/",
				insertText = name .. "/",
				filterText = name,
				kind = cmp.lsp.CompletionItemKind.Folder,
			})
		end
	end

	table.sort(items, function(a, b)
		return a.label < b.label
	end)

	callback({
		items = items,
		isIncomplete = false,
	})
end

return source
