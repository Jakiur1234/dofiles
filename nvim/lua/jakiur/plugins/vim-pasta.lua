return {
	"sickill/vim-pasta",
	config = function()
		vim.g.paste_disabled_filetypes = { "fugitive" }
	end,
}
