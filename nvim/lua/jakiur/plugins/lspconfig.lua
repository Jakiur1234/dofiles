return {
    "neovim/nvim-lspconfig",
    event = 'VeryLazy',
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'b0o/schemastore.nvim',
    },
    keys = {
        { '<Leader>d', '<cmd>Lua vim.diagnostic.open_float()<CR>' },
        { '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>' },
        { 'J]d', '<cmd>lua vim.diagnostic.goto_next()<CR>' },
        { 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>' },
        { 'fi', ':Telescope lsp_implementations<CR>' },
        { 'gr', ':Telescope lsp_references<CR>' },
        { 'K', '<cmd>lua vim.lsp.buf.hover()<CR>' },
        { '<Leader>rn', '<cmd>lua vim.lsp.buf.rename<CR>' },
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({ automatic_installation = true })

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        local lspcnf = require('lspconfig')

        -- PHP
        lspcnf.intelephense.setup({
          capabilities = capabilities,
          commands = {
            IntelephenseIndex = {
              function()
                vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
              end,
            },
          },
        })

        -- JS
        -- lspcnf.volar.setup({
        --   capabilities = capabilities,
        --   filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
        -- })

        -- Tailwind CSS
        lspcnf.tailwindcss.setup({
          capabilities = capabilities,
        })

        -- Jsonls
        lspcnf.jsonls.setup({
          capabilities = capabilities,
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
            },
          },
        })

        -- Clangd (C/C++)
        lspcnf.clangd.setup({
          capabilities = capabilities,
          single_file_support = true,
        })

      -- Tssserver
    require('lspconfig').ts_ls.setup({
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
            languages = {"javascript", "typescript", "vue"},
          },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
      },
    })

    -- Lua
    require('lspconfig').lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = {
              '${3rd}/luv/library',
              unpack(vim.api.nvim_get_runtime_file('', true)),
            },
          }
        }
      }
    })

    -- Eslint
    require('lspconfig').eslint.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
      handlers = {
        ['textDocument/publishDiagnostics'] = function() end
      }
    })

    -- Bashls
    require('lspconfig').bashls.setup({
      capabilities = capabilities,
    })

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
