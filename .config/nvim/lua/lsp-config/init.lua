-- vim.lsp.set_log_level('debug')
local client_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig-bundler').setup()
-- require('lspconfig.configs').vtsls = require('vtsls').lspconfig

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
vim.lsp.config('eslint', require('lsp-config.servers.eslint')(default_config))
vim.lsp.config('jsonls', require('lsp-config.servers.jsonls')(default_config))
vim.lsp.config('lua_ls', require('lsp-config.servers.lua_ls')(default_config))
vim.lsp.config('pylsp', require('lsp-config.servers.pylsp')(default_config))
vim.lsp.config('ruby_lsp', require('lsp-config.servers.ruby-lsp')(default_config))
vim.lsp.config('tailwindcss', require('lsp-config.servers.tailwindcss')(default_config))
vim.lsp.config('yamlls', require('lsp-config.servers.yamlls')(default_config))
