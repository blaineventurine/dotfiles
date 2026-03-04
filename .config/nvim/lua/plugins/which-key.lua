return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeoutlen = 300
  end,
  opts = {
    preset = 'classic',
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = false,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = 'none',
      padding = { 1, 2 },
    },
    layout = {
      width = { min = 20, max = 50 },
      spacing = 3,
    },
    icons = {
      breadcrumb = '»',
      separator = '➜',
      group = '+',
    },
    show_help = true,
  },
  config = function(_, opts)
    require('which-key').setup(opts)
    require('settings.keymaps')
  end,
}
