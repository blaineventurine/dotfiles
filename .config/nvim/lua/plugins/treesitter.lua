return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  cmd = {
    'TSInstall',
    'TSInstallInfo',
    'TSUpdate',
    'TSBufEnable',
    'TSBufDisable',
    'TSEnable',
    'TSDisable',
    'TSModuleInfo',
  },
  event = 'VeryLazy',
  dependencies = {
    'JoosepAlviste/nvim-ts-context-commentstring',
  },
  config = function()
    require('ts_context_commentstring').setup {}
    local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
    if not status_ok then
      return
    end
    treesitter.setup({
      ensure_installed = require('utils').parsers,
      sync_install = false,
      indent = {
        enable = true,
      },
      highlight = {
        enable = true, -- false will disable the whole extension
      },
      endwise = {
        enable = true,
      },
      autopairs = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
    })
  end,
}
