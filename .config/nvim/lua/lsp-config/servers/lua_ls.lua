return function(default_config)
  return {
    on_attach = default_config.on_attach,
    capabilities = default_config.capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
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
  }
end
