return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  main = 'ibl',
  config = function()
    require('ibl').setup({
      -- space_char_blankline = ' ',
      -- show_current_context = true,
      -- show_current_context_start = true,
    })
  end,
}
