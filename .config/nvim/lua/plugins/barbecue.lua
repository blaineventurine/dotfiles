return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  event = 'VeryLazy',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  config = function()
    require('barbecue').setup({
      theme = 'tokyonight',
      show_dirname = true,
      ---Whether to display file name.
      show_basename = true,
      ---Whether to replace file icon with the modified symbol when buffer is
      show_modified = false,
      ---Whether to show/use navic in the winbar.
      show_navic = true,
      ---Whether context text should follow its icon's color.
      context_follow_icon_color = true,
      symbols = {
        ---Modification indicator.
        modified = '●',
        ---Truncation indicator.
        ellipsis = '…',
        ---Entry separator.
        separator = '>',
      },
      kinds = require('utils.icons').kinds
    })
  end,
}
