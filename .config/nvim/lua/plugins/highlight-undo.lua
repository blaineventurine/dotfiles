return {
  'tzachar/highlight-undo.nvim',
  event = 'VeryLazy',
  opts = {
    duration = 500,
    undo = {
      hlgroup = 'HighlightUndo',
      mode = 'n',
      lhs = 'u',
      map = 'undo',
      opts = {},
    },
    redo = {
      hlgroup = 'HighlightUndo',
      mode = 'n',
      lhs = '<C-r>',
      map = 'redo',
      opts = {},
    },
    highlight_for_count = true,
  },
}
