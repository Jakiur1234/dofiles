-- Variable declaration section
local map = vim.keymap.set

-- Space is the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- When text is wrapped, m by terminal rows, not line, unless a count is provided.
-- example of key-maps map(mode, mapping_key, execute_command, options)
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting
map('v', '<', '<v')
map('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection
map('v', 'y', 'myy`y')

-- Disable command line typo
map('n', 'q:', ':q')

-- Paste replace visual selection without copying it
map('v', 'p', '"_dP')

-- Easy insertion of trailing characters
map('i', ';;', '<Esc>A;')
map('i', ',,', '<Esc>A,')

-- Go to end of the line in insert mode
map('i', '<C-e>', '<Esc>A')

-- Keybindings for no highlights
map('n', '<Leader>k', ':nohlsearch<CR>')

-- Open current file in the default program
map('n', '<Leader>x', ':!open %<CR><CR>')

-- Move line ups to down by keymap
map('i', '<C-j>', '<Esc>:m .+1<CR>==gi')
map('i', '<C-k>', '<Esc>:m .-2<CR>==gi')
map('n', '<C-j>', ':m .+1<CR>==')
map('n', '<C-k>', ':m .-2<CR>==')
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")
