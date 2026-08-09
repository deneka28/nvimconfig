local cmp = require("cmp")

local parser = require("cmp_qml.parser")
local cache = require("cmp_qml.cache")

local Source = {}
Source.__index = Source

function Source.new()
	return setmetatable({}, Source)
end

function Source:is_available()
	return vim.bo.filetype == "qml"
end

function Source:get_debug_name()
	return "cmp-qml"
end

function Source:get_trigger_characters()
	return {
		"/",
		".",
		'"',
		"'",
	}
end

function Source:complete(params, callback)
	local ctx = parser.parse(params.context.cursor_before_line)

	if not ctx.valid then
		callback({
			items = {},
			isIncomplete = false,
		})
		return
	end

	local base = vim.fn.expand("%:p:h")

	local directory = vim.fs.normalize(base .. "/" .. ctx.directory)

	local scan = cache.get(directory)

	local items = {}

	for _, entry in ipairs(scan.entries) do
		if vim.startswith(entry.name:lower(), ctx.prefix:lower()) then
			table.insert(items, {

				label = entry.name .. "/",

				insertText = entry.name .. "/",

				filterText = entry.name,

				kind = cmp.lsp.CompletionItemKind.Folder,

				documentation = {
					kind = "markdown",
					value = scan.has_qmldir and "**QML Module**" or "**Directory**",
				},

				data = {
					is_directory = true,
					path = entry.path,
				},
			})
		end
	end

	callback({
		items = items,
		isIncomplete = false,
	})
end

return Source
