-- To maange lsp and formatters

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-null-ls.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({ automatic_installation = true })
		require("mason-null-ls").setup({
			ensure_installed = {
				"pint", -- PHP
				"eslint_d", -- JavaScript/TypeScript
				"blade-formatter", -- Blade templates
				"stylua", -- Lua
				"prettier", -- HTML, CSS, C++, C
				"blue", -- Python Formatter
				"black", -- Python Formatter
			},
			automatic_installation = true,
		})

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.pint,
				null_ls.builtins.formatting.eslint_d,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.blade_formatter,
			},
		})
	end,
}
