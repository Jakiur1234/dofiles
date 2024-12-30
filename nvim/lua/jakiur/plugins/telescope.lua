return {
	"nvim-telescope/telescope.nvim",
	priority = 1000,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"folke/todo-comments.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-live-grep-args.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")

		vim.cmd([[
            highlight link TelescopePromptTitle PMenuSel
            highlight link TelescopePreviewTitle PMenuSel
            highlight link TelescopePromptNormal NormalFloat
            highlight link TelescopePromptBorder FloatBorder
            highlight link TelescopeNormal CursorLine
            highlight link TelescopeBorder CursorLineBg
        ]])

		-- Custom action to open multiple files in tabs

		-- Custom function to search under a folder
		local function search_under_folder()
			local input = vim.fn.input("Search Folder > ", "", "dir")
			if input and input ~= "" then
				require("telescope").extensions.live_grep_args.live_grep_args({ cwd = input })
			end
		end

		-- Custom function to search under a folder
		local function search_under_current_directory()
			-- Get the current file's directory
			local current_file_dir = vim.fn.expand("%:p:h")

			-- Check if a valid directory is found
			if current_file_dir == "" then
				vim.notify("No valid current directory found!", vim.log.levels.WARN)
				return
			end

			-- Trigger Telescope's live_grep_args with the directory as `cwd`
			require("telescope").extensions.live_grep_args.live_grep_args({ cwd = current_file_dir })
		end

		-- Telescope Setup
		require("telescope").setup({
			defaults = {
				path_display = { truncate = 1 },
				prompt_prefix = " Search ",
				selection_caret = "",
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
				mappings = {
					i = {
						["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
						-- It will open mutiple files in tabs
						["<C-o>"] = function(p_bufnr)
							require("telescope.actions").send_selected_to_qflist(p_bufnr)
							vim.cmd.cfdo("edit")
						end,
					},
					n = {
						["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
						["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
						-- It will open mutiple files in tabs
						["<C-o>"] = function(p_bufnr)
							require("telescope.actions").send_selected_to_qflist(p_bufnr)
							vim.cmd.cfdo("edit")
						end,
						["q"] = actions.close,
					},
				},
				file_ignore_patterns = { ".git/", "vendor/" },
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				buffers = {
					previewer = false,
					layout_config = {
						width = 80,
					},
				},
				oldfiles = {
					prompt_title = "History",
				},
				lsp_references = {
					previewer = false,
				},
			},
		})

		-- Load extensions
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("live_grep_args")

		-- Key mappings for telescope
		vim.keymap.set("n", "<Leader>f", function()
			require("telescope.builtin").find_files()
		end)
		vim.keymap.set("n", "<Leader>F", function()
			require("telescope.builtin").find_files({ no_ignore = true, prompt_title = "ALL Files" })
		end)
		vim.keymap.set("n", "<Leader>b", function()
			require("telescope.builtin").buffers()
		end)
		vim.keymap.set("n", "<Leader>g", function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end)
		vim.keymap.set("n", "<Leader>h", function()
			require("telescope.builtin").oldfiles()
		end)
		vim.keymap.set("n", "<Leader>s", function()
			require("telescope.builtin").lsp_document_symbols()
		end)
		vim.keymap.set("n", "<Leader>p", function()
			search_under_folder()
		end)
		vim.keymap.set("n", "<Leader>P", function()
			search_under_current_directory()
		end)
	end,
}
