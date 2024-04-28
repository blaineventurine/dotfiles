return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  event = 'VeryLazy',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('barbecue').setup({
      theme = 'tokyonight',
      show_dirname = true,
      show_basename = true,
      show_modified = false,
      show_navic = true,
      context_follow_icon_color = true,
      symbols = {
        modified = '●',
        ellipsis = '…',
        separator = '>',
      },
      kinds = require('utils.icons').kinds
    })
  end,
}
