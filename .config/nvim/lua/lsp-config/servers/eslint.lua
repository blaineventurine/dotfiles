return function(lspconfig, default_config)
  local opts = {}
  local cwd = vim.fn.getcwd()

  if string.find(cwd, 'AlgoliaWeb') then
    opts.rulePaths = { './_client/.eslint_rules' }
  end

  if string.find(cwd, '_client') then
    opts.rulePaths = { './.eslint_rules' }
  end

  if string.find(cwd, '_client_admin') then
    opts.rulePaths = { './eslint_rules' }
  end

  lspconfig.eslint.setup({
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = true
      default_config.on_attach(client, bufnr)
    end,
    capabilities = default_config.capabilities,
    -- cmd = { unpack(eslint_config.default_config.cmd) },
    settings = {
      --   format = { enable = true },
      packageManager = 'yarn',
      options = opts,
    },
  })
end
