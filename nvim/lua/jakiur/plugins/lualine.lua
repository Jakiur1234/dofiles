-- A status line
return {
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('lualine').setup({
            sections = {
              lualine_a = {
                'mode'
              },
              lualine_b = {
                'branch',
                {
                  'diff',
                  symbols = { added = ' ', modified = ' ', removed = ' ' },
                },
                function ()
                  return '󰅭 ' .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or '')
                end,
                { 'diagnostics', sources = { 'nvim_diagnostic' } },
              },
              lualine_c = {
                'filename'
              },
              lualine_x = {
                {
                  color = { fg = "#ff9e64" },
                },
              },
              lualine_y = {
                'filetype',
                'encoding',
                'fileformat',
                '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
              },
              lualine_z = {
                'searchcount',
                'selectioncount',
                'location',
                'progress',
              },
            },
        })
    end,
}
