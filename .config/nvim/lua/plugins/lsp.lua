return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'mihyaeru21/nvim-lspconfig-bundler',
    'b0o/schemastore.nvim',
    'folke/neodev.nvim',
    { 'nvimtools/none-ls.nvim', dependencies = { 'nvimtools/none-ls-extras.nvim' } },
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    'jay-babu/mason-null-ls.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('mason').setup({
      ui = { border = 'single' },
      PATH = 'append',
    })
    require('neodev').setup({
      library = {
        plugins = { 'neotest' },
        types = true,
      },
    })
    require('mason-null-ls').setup({
      automatic_installation = true,
      automatic_setup = true,
      ensure_installed = require('utils').linters,
    })

    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
      automatic_enable = true
    })

    require('lsp-config.init')

    local signs = require('utils.icons').diagnostics
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.INFO] = signs.Info,
          [vim.diagnostic.severity.HINT] = signs.Hint,
        },
      },
    })

    local nls = require('null-ls')
    local custom_dict_path = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'
    -- R - Refactoring-related checks: Enforces the use of snake_case naming convention.
    -- C - Convention-related checks: Ensures adherence to established coding standards.
    -- W0511: Disables the TODO warning.
    -- W1201, W1202: Disables log format warnings, which may be false positives.
    -- W0231: Disables the super-init-not-called warning as pylint may not comprehend six.with_metaclass(ABCMeta).
    -- W0707: Disables the raise-missing-from warning, which is incompatible with Python 2 backward compatibility.
    -- C0301: Disables the "line too long" warning, as the Black formatter automatically handles long lines.
    local flake8 = require('none-ls.diagnostics.flake8').with({
      extra_args = {
        '--max-line-length=100',
        '--ignore=R,duplicate-code,W0231,W0511,W1201,W1202,W0707,C0301,no-init',
      },
    })

    nls.setup({
      sources = {
        nls.builtins.code_actions.gitsigns,
        nls.builtins.code_actions.proselint,
        nls.builtins.code_actions.refactoring,
        nls.builtins.code_actions.textlint,

        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.buf,
        nls.builtins.diagnostics.codespell.with({
          extra_args = { '--ignore-words', custom_dict_path },
        }),
        nls.builtins.diagnostics.erb_lint,
        flake8,
        nls.builtins.diagnostics.hadolint,
        nls.builtins.diagnostics.haml_lint,
        nls.builtins.diagnostics.markdownlint,
        nls.builtins.diagnostics.mypy,
        nls.builtins.diagnostics.reek,
        nls.builtins.diagnostics.rubocop.with({
          extra_filetypes = { 'eruby' },
        }),
        -- nls.builtins.diagnostics.semgrep.with({
        --   -- args = { 'lsp' }, --, '--config', 'auto', '--json', '$FILENAME' },
        --   args = {
        --     '--metrics=off',
        --     '--config',
        --     'p/trailofbits',
        --     '--config',
        --     'p/ruby',
        --     '--config',
        --     'p/typescript',
        --     '-q',
        --     '--json',
        --     '$FILENAME',
        --   },
        --   -- args = { '--config', 'auto', '-q', '--json', '$FILENAME', '--metrics=off' },
        --   method = nls.methods.DIAGNOSTICS_ON_SAVE,
        -- }),
        nls.builtins.diagnostics.vale,
        nls.builtins.diagnostics.yamllint,

        -- nls.builtins.formatting.codespell,
        nls.builtins.formatting.black.with({
          extra_args = { '--line-length=100' },
        }),
        nls.builtins.formatting.isort,
        nls.builtins.formatting.erb_format,
        nls.builtins.formatting.gofumpt,
        nls.builtins.formatting.goimports,
        require('none-ls.formatting.jq'),
        nls.builtins.formatting.markdownlint,
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.rubocop.with({
          extra_filetypes = { 'eruby' },
        }),
        nls.builtins.formatting.shellharden,
        nls.builtins.formatting.stylua,

        nls.builtins.hover.dictionary,
        nls.builtins.hover.printenv,
      },
    })
  end,
}
