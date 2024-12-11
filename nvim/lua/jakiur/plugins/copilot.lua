-- Add GitHub Copilot
return{
    'github/copilot.vim',
    config = function()
        vim.g.copilot_no_tab_map = true -- Disable default keybindings
        vim.api.nvim_set_keymap("i", "<D-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
        vim.cmd([[imap <silent><script><expr> <D-j> copilot#Accept("\<CR>")]])
    end,
}
