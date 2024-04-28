return function(lspconfig, default_config)
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
end
