return function(lspconfig, default_config)
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
end
