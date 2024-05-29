return function(lspconfig, default_config)
  lspconfig.tailwindcss.setup({
    capabilities = default_config.capabilities,
    on_attach = default_config.on_attach,
  })
end
