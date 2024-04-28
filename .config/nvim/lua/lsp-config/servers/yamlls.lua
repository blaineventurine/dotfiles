return function(lspconfig, default_config)
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
end
