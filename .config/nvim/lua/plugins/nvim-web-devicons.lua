return {
  'nvim-tree/nvim-web-devicons',
  lazy = true,
  config = function()
    require('nvim-web-devicons').setup({
      override_by_filename = {
        ['.gitignore'] = {
          icon = require('utils.icons').general.Git,
          color = '#f1502f',
          name = 'Gitignore',
        },
        ['Dockerfile'] = {
          icon = require('utils.icons').general.Dockerfile,
          color = '#2e5f99',
          cterm_color = '25',
          name = 'Dockerfile',
        },
      },
      override_by_extension = {
        ['log'] = {
          icon = require('utils.icons').general.Logfile,
          color = '#81e043',
          name = 'Log',
        },
      },
    })
  end,
}
