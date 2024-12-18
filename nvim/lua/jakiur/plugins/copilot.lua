-- Add GitHub Copilot
return{
    'github/copilot.vim',
    config = function()
        vim.g.copilot_no_tab_map = true -- Disable default keybindings
        vim.api.nvim_set_keymap("i", "cc", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        vim.cmd([[imap <silent><script><expr> cc copilot#Accept("\<CR>")]])
    end,
}
