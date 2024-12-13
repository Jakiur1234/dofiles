return {
    'rmagatti/auto-session',
    keys = {
        { '<leader>ls', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    },
    opts = {
      suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
        session_lens = {
            load_on_setup = true,

            previewer = false,

            mappings = {
              delete_session = { "i", "<C-D>" },
              alternate_session = { "i", "<C-S>" },
              copy_session = { "i", "<C-Y>" },
            },
        },
    }
}
