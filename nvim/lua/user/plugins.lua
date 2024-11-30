local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
require('packer').reset()
require('packer').init({
    compile_path = vim.fn.stdpath('data')..'/site/plugin/packer_compiled.lua',
   display = {
       open_fn = function()
           return require('packer.util').float({ border = 'solid' })
       end,
   },
})

local use = require('packer').use

-- Packer plugin to handle all plugin install and synchronisation
use('wbthomason/packer.nvim')

-- Install a colorscheme
use { "catppuccin/nvim", as = "catppuccin" }

-- Change the theme
use({
    'jessarcher/onedark.nvim',
    config = function()
        vim.cmd('colorscheme catppuccin-mocha')
        vim.api.nvim_set_hl(0, 'FloatBorder', {
            fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background, 
            bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background, 
        })
        -- Make the cursor line background invisible
        vim.api.nvim_set_hl(0, 'CursorLineBg', {
            fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
            bg = vim.api.nvim_get_hl_by_name('CursorLine', true).backgrround,
        })

        vim.api.nvim_set_hl(0, 'NvimTreeIndentMaker', {fg = '#30323E'})

        vim.api.nvim_set_hl(0, 'StatusLineNonText', {
            fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
            fg = vim.api.nvim_get_hl_by_name('StatusLine', true).foreground,
        })
    end,
})

-- For commenting a line. Just press gcc to comment and uncomment 
use('tpope/vim-commentary')

-- Add, Change, and Delete surrounding text
use('tpope/vim-surround')

-- Useful command like :Rename and :SudoWrite
use('tpope/vim-eunuch')

-- Pairs of handy bracket mappings, like [b and ]b
use('tpope/vim-unimpaired')

-- Indent autodetection with editorconfig support
use('tpope/vim-sleuth')

-- Allow plugins to enable repeating of commands. Use . key to re-run the command
use('tpope/vim-repeat')

-- Add more language
use('sheerun/vim-polyglot')

-- tmux screen switching by pressing ctrl + h/j/k/l
use('christoomey/vim-tmux-navigator')

-- Jump to the last location when opening a file
use('farmergreg/vim-lastplace')

-- Enable * searching with visually selected text
use('nelstrom/vim-visual-star-search')

-- Automatically create parent directory when saving
use('jessarcher/vim-heritage')

-- Text objects for HTML attributes
use({
    'whatyouhide/vim-textobj-xmlattr',
    requires = 'kana/vim-textobj-user',
})

use({
    'airblade/vim-rooter',
    setup = function()
        -- Instead of this running every time we open a file, we'll just run it once when vim starts.
        vim.g.rooter_manual_only = 1
    end,
    config = function()
        vim.cmd('Rooter')
    end,
})

-- Automatically add closing brackets, quotes, etc
use({
    'windwp/nvim-autopairs',
    config = function()
        require('nvim-autopairs').setup()
    end,
})
-- Add smooth scrolling to avoid jarring jumps
-- Scroll via Ctrl+d and Ctrl+u
use({
    'karb94/neoscroll.nvim',
    config = function()
        require('neoscroll').setup()
    end,
})

-- All closing buffer without closing the split window
use({
    'famiu/bufdelete.nvim',
    config = function()
        vim.keymap.set('n','<Leader>q', ':Bdelete<CR>')
    end,
})

-- Split arrays and methods onto multiple lines, or join them back up
use({
    'AndrewRadev/splitjoin.vim',
    config = function()
        vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
        vim.g.splitjoin_trailing_comma = 1
        vim.g.splitjoin_php_method_chain_full = 1
    end,
})

-- Automatically set up your configuration when pasting code
use({
    'sickill/vim-pasta',
    config = function()
        vim.g.paste_disabled_filetypes = {'fugitive'}
    end,
})

-- Install plenary for packer
use "nvim-lua/plenary.nvim"

-- Now install the telescope fuzzy finder
use({ 
    'nvim-telescope/telescope.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'nvim-telescope/telescope-live-grep-args.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
        }
    },
    config = function()
        require('user/plugins/telescope')
    end,
})

-- Setup a file explorer for nvim
-- The below file manager is for you
use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user/plugins/nvim-tree')
    end,
})

-- A status line
use({
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('user/plugins/lualine')
    end,
})

-- Use Buffer Line for the plugin
use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdanii42/nvim-web-devicons',
    after = 'onedark.nvim',
    config = function()
        require('user/plugins/bufferline')
    end,
})

-- Dashboard for nvim
use({
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('user/plugins/dashboard-nvim')
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
})

-- Git Integration
use({ 'lewis6991/gitsigns.nvim',
    config = function()
        require('gitsigns').setup({
            current_line_blame = true,    
        })
        vim.keymap.set('n', ']h', ':Gitsigns next_hunk<CR>')
        vim.keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>')
        vim.keymap.set('n', 'gs', ':Gitsigns stage_hunk<CR>')
        vim.keymap.set('n', 'gS', ':Gitsigns undo_stage_hunk<CR>')
        vim.keymap.set('n', 'gp', ':Gitsigns preview_hunk<CR>')
        vim.keymap.set('n', 'gb', ':Gitsigns blame_line<CR>')
        -- use :G blame to see full blame list
    end,
})

-- 
use({
    'tpope/vim-fugitive',
    require = 'tpope/vim-rhubarb',
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
    require('packer').sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile>
  augroup end
]])
