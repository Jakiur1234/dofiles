-- Set a variable for reuse it
local optset = vim.opt

-- Continue to the setup from now
optset.expandtab = true
optset.autoindent = true
optset.shiftwidth = 4
optset.tabstop = 4
optset.softtabstop = 4

optset.smartindent = true

optset.wrap = true 

optset.number = true
optset.relativenumber = true

optset.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them
optset.completeopt = 'menuone,longest,preview'

optset.title = true
optset.mouse = 'a' --enable mouse for all modes

optset.termguicolors = true

optset.spell = true

optset.ignorecase = true
optset.smartcase = true

optset.list = true -- enable the below list-characters
optset.listchars = { tab = '▸ ', trail = '·', nbsp = '␣' }
optset.fillchars:append({ eob = ' ' }) -- remove the ~ from buffer

optset.splitbelow = true
optset.splitright = true

optset.scrolloff = 0
optset.sidescrolloff = 0

optset.clipboard = 'unnamedplus' -- Use system clipboard
optset.confirm = true

optset.undofile = true -- Remember undo history
optset.backup = true -- automatically save a backup file
optset.backupdir:remove('.') -- keep backup out of the current directory
