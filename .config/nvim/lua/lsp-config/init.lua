-- vim.lsp.set_log_level('debug')
local client_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

require('lspconfig-bundler').setup()
require('lspconfig.configs').vtsls = require('vtsls').lspconfig

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

    if client.server_capabilities.documentSymbolProvider then
      require('nvim-navic').attach(client, bufnr)
    end

    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd('CursorHold', {
        callback = vim.lsp.buf.document_highlight,
        group = highlight_cmd_group,
        buffer = bufnr,
      })
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

-- Server-specific configurations
local servers = {
  eslint = function()
    require('lsp-config.servers.eslint')(lspconfig, default_config)
  end,
  jsonls = function()
    require('lsp-config.servers.jsonls')(lspconfig, default_config)
  end,
  lua_ls = function()
    require('lsp-config.servers.lua_ls')(lspconfig, default_config)
  end,
  pylsp = function()
    require('lsp-config.servers.pylsp')(lspconfig, default_config)
  end,
  ruby_lsp = function()
    require('lsp-config.servers.ruby-lsp')(lspconfig, default_config)
  end,
  tailwindcss = function()
    require('lsp-config.servers.tailwindcss')(lspconfig, default_config)
  end,
  yamlls = function()
    require('lsp-config.servers.yamlls')(lspconfig, default_config)
  end,
}

-- Return the setup_handlers function that mason-lspconfig expects
return function(server_name)
  if servers[server_name] then
    servers[server_name]()
  else
    -- Default setup for servers not explicitly configured
    lspconfig[server_name].setup({
      capabilities = default_config.capabilities,
      on_attach = default_config.on_attach,
    })
  end
end
