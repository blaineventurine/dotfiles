-- vim.lsp.set_log_level('debug')
local client_capabilities = require('cmp_nvim_lsp').default_capabilities()
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

    if client.name == 'eslint' then
      client.server_capabilities.documentFormattingProvider = true
    elseif client.name == 'tsserver' or client.name == 'typescript-tools' then
      client.server_capabilities.documentFormattingProvider = false
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

  eslint = require('lsp-config.servers.eslint')(lspconfig, default_config),
  jsonls = require('lsp-config.servers.jsonls')(lspconfig, default_config),
  lua_ls = require('lsp-config.servers.lua_ls')(lspconfig, default_config),
  ruby_lsp = require('lsp-config.servers.ruby-lsp')(lspconfig, default_config),
  tailwindcss = require('lsp-config.servers.tailwindcss')(lspconfig, default_config),
  yamlls = require('lsp-config.servers.yamlls')(lspconfig, default_config),
}
