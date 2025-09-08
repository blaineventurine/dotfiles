return function(lspconfig, default_config)
  lspconfig.lua_ls.setup({
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
          library = {
            vim.env.VIMRUNTIME,
          },
          -- vim.api.nvim_get_runtime_file("", true)
        },
      },
    },
  })
end
