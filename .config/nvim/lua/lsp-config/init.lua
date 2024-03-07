-- vim.lsp.set_log_level('debug')
local client_capabilities = require('cmp_nvim_lsp').default_capabilities() --(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

require('lspconfig-bundler').setup()

client_capabilities.textDocument.completion.completionItem.snippetSupport = true
client_capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

local highlight_cmd_group = vim.api.nvim_create_augroup('Highlight', {
  clear = true,
})

local default_config = {
  on_attach = function(client, bufnr)
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    end
    if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, bufnr)
    end
    if client.server_capabilities.documentHighlightProvider then
      -- Highlight word under cursor on hold
      vim.api.nvim_create_autocmd('CursorHold', {
        callback = vim.lsp.buf.document_highlight,
        group = highlight_cmd_group,
        buffer = bufnr,
      })

      -- Clear highlights on cursor move
      vim.api.nvim_create_autocmd('CursorMoved', {
        callback = vim.lsp.buf.clear_references,
        group = highlight_cmd_group,
        buffer = bufnr,
      })
    end
  end,
  capabilities = client_capabilities,
  flags = { debounce_text_changes = 200 },
}

return {
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = default_config.capabilities,
      on_attach = default_config.on_attach,
    })
  end,

  jsonls = function()
    lspconfig.jsonls.setup({
      capabilities = default_config.capabilities,
      on_attach = default_config.on_attach,
      settings = {
        json = {
          schemas = {
            require('schemastore').json.schemas(),
          },
          validate = { enable = true },
        },
      },
    })
  end,
  solargraph = function()
    -- local util = require('lspconfig.util')
    lspconfig.solargraph.setup({
      capabilities = default_config.capabilities,
      on_attach = default_config.on_attach,
      -- settings = {
      --   solargraph = {
      --     root_dir = util.root_pattern('Gemfile', '.git'), --or util.path.dirname(vim.api.nvim_buf_get_name(0)),
      --     diagnostic = true,
      --     references = true,
      --     symbols = true
      --   },
      -- },
    })
  end,
  sorbet = function()
    lspconfig.sorbet.setup({
      capabilities = default_config.capabilities,
      on_attach = default_config.on_attach,
    })
  end,
  yamlls = function()
    lspconfig.yamlls.setup({
      capabilities = default_config.capabilities,
      on_attach = default_config.on_attach,
      settings = {
        yaml = {
          schemaStore = {
            -- You must disable built-in schemaStore support if you want to use
            -- this plugin and its advanced options like `ignore`.
            enable = false,
            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
            url = '',
          },
          schemas = require('schemastore').yaml.schemas(),
        },
      },
    })
  end,
  eslint = function()
    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = true
        -- vim.cmd('autocmd BufWritePre <buffer> Prettier')
        -- vim.cmd('autocmd BufWritePre <buffer> EslintFixAll')

        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      -- cmd = { unpack(eslint_config.default_config.cmd) },
      settings = {
        --   format = { enable = true },
        packageManage = 'yarn',
      },
      -- root_dir = function(fname)
      --     -- return '~/repos/AlgoliaWeb/_client'
      --   return lspconfig.util.find_package_json_ancestor(fname)
      -- end
    })
  end,
  lua_ls = function()
    lspconfig.lua_ls.setup({
      -- on_attach = function(client, bufnr)
      --   client.server_capabilities.document_formatting = false
      -- end,
      on_attach = default_config.on_attach,
      capabilities = default_config.capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = 'Both',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    })
  end,
}
