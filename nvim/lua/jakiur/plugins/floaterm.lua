--- Floating terminal

return {
	"voldikss/vim-floaterm",
	keys = {
		{ "TT", ":FloatermToggle<CR>" },
		{ "TT", "<Esc>:FloatermToggle<CR>", mode = "i" },
		{ "TT", "<C-\\><C-n>:FloatermToggle<CR>", mode = "t" },
	},
	cmd = { "FloatermToggle" },
	init = function()
		vim.g.floaterm_width = 0.8
		vim.g.floaterm_height = 0.8
	end,
}
