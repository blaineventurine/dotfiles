return function(default_config)
  local flake_ignores = {
    'E203', -- whitespace before :
    'W503', -- line break before binary operator
    'E501', -- line too long
    'C901', -- mccabe complexity
  }

  local config = {
    capabilities = default_config.capabilities,
    on_attach = default_config.on_attach,
    settings = {
      pylsp = {
        plugins = {
          black = { enabled = true },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          -- pylint = { enabled = true, executable = 'pylint', args = { '--max-line-length=100' } },
          pyflakes = { enabled = true },
          pycodestyle = {
            enabled = false,
            ignore = { 'E501', 'E231' },
            maxLineLength = 100,
          },
          flake8 = {
            enabled = false,
            ignore = table.concat(flake_ignores, ','),
          },
          pylsp_mypy = { enabled = true },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
        },
      },
    },
  }

  return config
end
