return {
	"Wansmer/symbol-usage.nvim",
	event = "LspAttach",
	opts = {
		text_format = function(symbol)
			local res = {}

			if symbol.references then
				local usage = symbol.references == 1 and "reference" or "references"
				table.insert(res, { ("󰌹  %s %s"):format(symbol.references, usage), "LspCodeLens" })
			end

			return res
		end,
	},
}
