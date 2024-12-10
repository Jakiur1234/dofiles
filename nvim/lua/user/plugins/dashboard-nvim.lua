require('dashboard').setup {
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
      {
        icon = ' ',
        icon_hl = 'Title',
        desc = 'Find File           ',
        desc_hl = 'String',
        key = 'f',
        keymap = 'SPC',
        key_hl = 'Number',
        key_format = ' %s', -- remove default surrounding `[]`
        action = ':Telescope find_file'
      },
  },
    footer = {}  --your footer
  }
}
