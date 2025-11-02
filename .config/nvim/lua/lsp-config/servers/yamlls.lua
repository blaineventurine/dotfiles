print("yamlls.lua file loaded")

return function(default_config)
  print("yamlls function called with:", default_config and "valid config" or "nil config")
  
  local config = {
    capabilities = default_config.capabilities,
    on_attach = default_config.on_attach,
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = '',
        },
        schemas = {}, -- Simplified for now to avoid schemastore issues
      },
    },
  }
  
  print("yamlls returning config:", config and "valid" or "nil")
  return config
end
