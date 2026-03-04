return {
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    'mihyaeru21/nvim-lspconfig-bundler',
    'b0o/schemastore.nvim',
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
  },
  config = function()
    require('mason').setup({
      ui = { border = 'single' },
      PATH = 'append',
    })

    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup({
      automatic_enable = true,
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
  end,
}
