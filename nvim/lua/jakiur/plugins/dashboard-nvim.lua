return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        theme = 'doom',
        config = {
          header = {
                "",
                "",
                "",
                " ███████╗███╗   ██╗██╗ ██████╗ ███╗   ███╗ █████╗ ",
                " ██╔════╝████╗  ██║██║██╔════╝ ████╗ ████║██╔══██╗",
                " █████╗  ██╔██╗ ██║██║██║  ███╗██╔████╔██║███████║",
                " ██╔══╝  ██║╚██╗██║██║██║   ██║██║╚██╔╝██║██╔══██║",
                " ███████╗██║ ╚████║██║╚██████╔╝██║ ╚═╝ ██║██║  ██║",
                " ╚══════╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝",
                "",
                "Crafted By: AJDM Jakiur Rahman",
                "",
                "",
          },
          center = {
            { icon = '  ', desc = 'New file', action = 'enew' },
            { icon = '  ', desc = 'Find file               ', key = 'Space + f', action = 'Telescope find_files' },
            { icon = '  ', desc = 'Recent files            ', key = 'Space + h', action = 'Telescope oldfiles' },
            { icon = '  ', desc = 'Find Word               ', key = 'Space + g', action = 'Telescope live_grep' },
          },
            footer = {}  --your footer
          }
    }
}

