return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  build = ':MasonToolsInstall',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason-tool-installer').setup({
      ensure_installed = require('utils').servers,
      auto_update = true,
      run_on_start = true,
    })
  end,
}
