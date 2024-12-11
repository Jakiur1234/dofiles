-- File tree sidebar

return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  keys = {
    { '<leader>e', ':Neotree reveal toggle<CR>' },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      opts = {
        filter_rules = {
          autoselect_one = true,
          include_current_win = false,
          bo = {
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
            buftype = { 'terminal', "quickfix" },
          },
        },
        highlights = {
          statusline = {
            focused = {
              bg = '#9d7cd8',
            },
            unfocused = {
              bg = '#9d7cd8',
            },
          },
        },
      },
    },
  },
  opts = {
    close_if_last_window = true,
    hide_root_node = false,
    sources = {
      "filesystem",
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function (file_path)
          require("neo-tree.command").execute({ action = "close" })
        end,
      }
    },
    default_component_configs = {
      indent = {
        padding = 0,
      },
      name = {
        use_git_status_colors = false,
        highlight_opened_files = true,
      },
    },
    window = {
      mappings = {
        ["<cr>"] = "open_with_window_picker",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          "vendor",
        },
      },
      -- follow_current_file = {
      --   enabled = true,
      -- },
      group_empty_dirs = false
    },
  },
}
