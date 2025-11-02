return function(default_config)
  return {
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
  }
end
