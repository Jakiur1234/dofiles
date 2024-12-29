-- A nice plugin for monokai pro theme

return {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
        require("monokai-pro").setup({
            transparent_background = false,
            terminal_colors = true,
            devicons = true,
            styles = {
                comments = { italic = true },
            },
            inc_search = "background", -- underline | background
            background_clear = {
                "toggleterm",
                "floaterm",
                "telescope",
                "which-key",
                "renamer",
                "notify",
                "neo-tree",
                "bufferline",
            },
        })
        vim.cmd('colorscheme monokai-pro')
    end
}
