-- textDocument/diagnostic support until 0.10.0 is released
_timers = {}
local function setup_diagnostics(client, buffer)
  if require('vim.lsp.diagnostic')._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request('textDocument/diagnostic', { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format('diagnostics error - %s', vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      local diagnostic_items = {}
      if result then
        diagnostic_items = result.items
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend('keep', params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

-- adds ShowRubyDeps command to show dependencies in the quickfix list.
-- add the `all` argument to show indirect dependencies as well
local function add_ruby_deps_command(client, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, 'ShowRubyDeps', function(opts)
    local params = vim.lsp.util.make_text_document_params()

    local showAll = opts.args == 'all'

    client.request('rubyLsp/workspace/dependencies', params, function(error, result)
      if error then
        print('Error showing deps: ' .. error)
        return
      end

      local qf_list = {}
      for _, item in ipairs(result) do
        if showAll or item.dependency then
          table.insert(qf_list, {
            text = string.format('%s (%s) - %s', item.name, item.version, item.dependency),

            filename = item.path,
          })
        end
      end

      vim.fn.setqflist(qf_list)
      vim.cmd('copen')
    end, bufnr)
  end, {
    nargs = '?',
    complete = function()
      return { 'all' }
    end,
  })
end

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
  -- solargraph = function()
  --   -- local util = require('lspconfig.util')
  --   lspconfig.solargraph.setup({
  --     capabilities = default_config.capabilities,
  --     on_attach = default_config.on_attach,
  --     -- settings = {
  --     --   solargraph = {
  --     --     root_dir = util.root_pattern('Gemfile', '.git'), --or util.path.dirname(vim.api.nvim_buf_get_name(0)),
  --     --     diagnostic = true,
  --     --     references = true,
  --     --     symbols = true
  --     --   },
  --     -- },
  --   })
  -- end,
  -- sorbet = function()
  --   lspconfig.sorbet.setup({
  --     capabilities = default_config.capabilities,
  --     on_attach = default_config.on_attach,
  --   })
  -- end,
  ruby_lsp = function()
    lspconfig.ruby_lsp.setup({
      capabilities = default_config.capabilities,
      on_attach = function(client, buffer)
        setup_diagnostics(client, buffer)
        add_ruby_deps_command(client, buffer)
      end,
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
        default_config.on_attach(client, bufnr)
      end,
      capabilities = default_config.capabilities,
      -- cmd = { unpack(eslint_config.default_config.cmd) },
      settings = {
        --   format = { enable = true },
        packageManage = 'yarn',
      },
    })
  end,
  lua_ls = function()
    lspconfig.lua_ls.setup({
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
