return function(lspconfig, default_config)
  local flake_ignores = {
    'E203', -- whitespace before :
    'W503', -- line break before binary operator
    'E501', -- line too long
    'C901',
  } -- mccabe complexity
  lspconfig.pylsp.setup({
    capabilities = default_config.capabilities,
    on_attach = default_config.on_attach,
    settings = {
      pylsp = {
        plugins = {
          -- formatter options
          black = { enabled = true },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          -- linter options
          pylint = { enabled = true, executable = 'pylint', args = { '--max-line-length=100' } },
          pyflakes = { enabled = true },
          pycodestyle = {
            enabled = true,
            ignore = { 'E501', 'E231' },
            maxLineLength = 100,
          },
          flake8 = {
            enabled = false,
            ignore = table.concat(flake_ignores, ','),
          },
          -- type checker
          pylsp_mypy = { enabled = true },
          -- auto-completion options
          jedi_completion = { fuzzy = true },
          -- import sorting
          pyls_isort = { enabled = true },
        },
      },
    },
  })
end
