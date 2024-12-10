return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'b0o/schemastore.nvim',
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- PHP
    require('lspconfig').intelephense.setup({
      capabilities = capabilities,
    })

    -- JS
    require('lspconfig').volar.setup({
      capabilities = capabilities,
      filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
    })

    -- Tailwind CSS
    require('lspconfig').tailwindcss.setup({
      capabilities = capabilities,
    })

    require('lspconfig').jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
    })

    -- Keymaps
    local set = vim.keymap.set
    set('n', '<Leader>d', '<cmd>Lua vim.diagnostic.open_float()<CR>')
    set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
    set('n', 'fi', ':Telescope lsp_implementations<CR>')
    set('n', 'gr', ':Telescope lsp_references<CR>')
    set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

    -- Diagnostic Configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = {
        source = true,
      }
    })

    -- Sign Configuration
    vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
  end,
}
