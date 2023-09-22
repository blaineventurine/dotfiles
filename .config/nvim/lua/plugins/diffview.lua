return {
  'sindrets/diffview.nvim',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  config = function()
    require('diffview').setup({
      enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
    })
  end,
}
