return {
  'kdheepak/lazygit.nvim',
  cmd = { 'LazyGit', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('telescope').load_extension('lazygit')
  end,
}
