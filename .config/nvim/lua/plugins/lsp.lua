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
    mason_lspconfig.setup()
    -- mason_lspconfig.setup_handlers(require('lsp-config'))

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
    nls.setup({
      sources = {
        nls.builtins.code_actions.gitsigns,
        nls.builtins.code_actions.proselint,
        nls.builtins.code_actions.refactoring,
        nls.builtins.code_actions.textlint,

        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.buf,
        nls.builtins.diagnostics.codespell,
        nls.builtins.diagnostics.erb_lint,
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
