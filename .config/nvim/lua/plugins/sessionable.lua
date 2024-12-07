return {
  'blaineventurine/sessionable',
  cmd = {
    'SaveSession',
    'CreateGitSession',
    'RestoreSession',
    'DeleteSession',
    'DisableAutoSave',
    'SearchSessions',
  },
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('sessionable').setup({
      -- log_level = "debug"
      session_dir = vim.fn.stdpath('data') .. '/sessionable/sessions/',
      pre_save_cmds = { 'Neotree close' },
    })
  end,
}
