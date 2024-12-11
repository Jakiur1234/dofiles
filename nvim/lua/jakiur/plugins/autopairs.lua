-- Automatically add closing brackets, quotes, etc
return {
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end,
}
