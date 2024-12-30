-- A competitive programming plugin for Neovim

return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	keys = {
		{ "ct", ":CompetiTest add_testcase<CR>" },
		{ "ce", ":CompetiTest edit_testcase<CR>" },
		{ "cd", ":CompetiTest delete_testcase<CR>" },
		{ "cui", ":CompetiTest show_ui<CR>" },
		{ "cr", ":CompetiTest run<CR>" },
		{ "crp", ":CompetiTest receive problem<CR>" },
		{ "crc", ":CompetiTest receive contest<CR>" },
		{ "crt", ":CompetiTest receive testcases<CR>" },
	},
	config = function()
		require("competitest").setup({
			compile_command = {
				cpp = { exec = "g++", args = { "$(FNAME)", "-o", "$(FNOEXT)" } },
				-- some_lang = { exec = 'some_compiler', args = {'$(FNAME)'} },
			},
			run_command = {
				cpp = { exec = "./$(FNOEXT)" },
				-- some_lang = { exec = 'some_interpreter', args = {'$(FNAME)'} },
			},
		})
	end,
}
