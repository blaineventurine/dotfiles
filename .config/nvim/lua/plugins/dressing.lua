return {
  'stevearc/dressing.nvim',
  event = 'VeryLazy',
  config = function()
    require('dressing').setup({
      input = {
        insert_only = false,
        win_options = {
          winblend = 2,
        },
      },
      select = {
        winblend = 2,
        telescope = require('telescope.themes').get_cursor({
          layout_config = {
            height = function(self, _, max_lines)
              local results = #self.finder.results
              return (results <= max_lines and results or max_lines - 10) + 4 -- 4 is the size of the window
            end,
          },
        }),
      },
    })
  end,
}
