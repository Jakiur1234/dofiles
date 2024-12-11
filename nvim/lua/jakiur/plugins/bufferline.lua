-- Use Buffer Line for the plugin
return {
    'akinsho/bufferline.nvim',
    dependencies = 'kyazdanii42/nvim-web-devicons',
    config = function()
        require('bufferline').setup({
          options = {
            indicator = {
              icon = ' ',
            },
            show_close_icon = false,
            tab_size = 0,
            max_name_length = 25,
            offsets = {
              {
                filetype = 'NvimTree',
                text = 'Files',
                highlight = 'StatusLine',
                text_align = 'left',
              },
            },
            seperator_style = 'slant',
            modified_icon = '*',
            custom_areas = {
              left = function()
                return {
                  { text = '  ', fg = '#8fff6d' },
                }
              end,
            },
          },
        })
    end,
}
