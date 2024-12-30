return {
	"Vonr/align.nvim",
	branch = "v2",
	lazy = true,
	init = function()
		local NS = { noremap = true, silent = true }
		-- Aligns to 1 character
		vim.keymap.set("x", "ac", function()
			require("align").align_to_char({
				length = 1,
			})
		end, NS)
		-- Aligns to a string with previews
		vim.keymap.set("x", "aw", function()
			require("align").align_to_string({
				preview = true,
				regex = true,
			})
		end, NS)
	end,
}
