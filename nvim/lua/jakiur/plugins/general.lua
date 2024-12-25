return{
    -- For commenting a line. Just press gcc to comment and uncomment 
    {
    'tpope/vim-commentary',
    config = function()
        -- Maintain cursor position
        vim.keymap.set('n', 'gcap', 'my<cmd>norm vip<bar>gc<cr>`y')
    end,
    },

    -- Add, Change, and Delete surrounding text
    {'tpope/vim-surround'},

    -- Useful command like :Rename and :SudoWrite
    {'tpope/vim-eunuch'},

    -- Pairs of handy bracket mappings, like [b and ]b
    {'tpope/vim-unimpaired'},

    -- Indent autodetection with editorconfig support
    {'tpope/vim-sleuth'},

    -- Allow plugins to enable repeating of commands. Use . key to re-run the command
    {'tpope/vim-repeat'},

    -- tmux screen switching by pressing ctrl + h/j/k/l
    {'christoomey/vim-tmux-navigator'},

    -- Jump to the last location when opening a file
    {'farmergreg/vim-lastplace'},

    -- Enable * searching with visually selected text
    {'nelstrom/vim-visual-star-search'},

    -- Automatically create parent directory when saving
    {'jessarcher/vim-heritage'},

    -- Text objects for HTML attributes
    {
        'whatyouhide/vim-textobj-xmlattr',
        dependencies = 'kana/vim-textobj-user',
    },

    -- Work with several variants of a word at once.
    { 'tpope/vim-abolish' },

    -- Allow plugins to enable repeating of commands.
    { 'tpope/vim-repeat' },

    -- Vim TMUX Navigator
    { 'christoomey/vim-tmux-navigator' },
}
