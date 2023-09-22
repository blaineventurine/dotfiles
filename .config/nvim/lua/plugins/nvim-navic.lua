return {
  'SmiteshP/nvim-navic',
  dependencies = 'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  config = function()
    require('nvim-navic').setup({
      icons = require('utils.icons').kinds,
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      highlight = false,
      separator = ' > ',
      depth_limit = 0,
      depth_limit_indicator = '..',
      safe_output = true,
    })
  end,
}
