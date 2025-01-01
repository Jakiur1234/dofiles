return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			php = { "pint" },
			javascript = { "eslint_d", stop_after_first = true },
			typescript = { "eslint_d", stop_after_first = true },
			typescriptreact = { "eslint_d", stop_after_first = true },
			blade = { "blade-formatter" },
			lua = { "stylua" },
			html = { "prettier" },
			cpp = { "prettier" },
			c = { "prettier" },
			css = { "prettier" },
			python = { "black", "blue" },
		},
		format_on_save = {
			enabled = true,
			timeout_ms = 1000,
		},
	},
}
