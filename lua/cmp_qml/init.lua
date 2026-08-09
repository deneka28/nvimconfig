local cmp = require("cmp")

local M = {}

function M.setup()
	cmp.register_source("qml_import", require("cmp_qml.source").new())

	cmp.event:on("confirm_done", function(evt)
		local entry = evt.entry

		if not entry then
			return
		end

		if entry.source.name ~= "qml_import" then
			return
		end

		vim.schedule(function()
			cmp.complete({
				reason = cmp.ContextReason.Auto,
			})
		end)
	end)
end

return M
