return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  build = ':MasonToolsInstall',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    local utils = require('utils')
    require('mason-tool-installer').setup({
      ensure_installed = vim.list_extend(vim.deepcopy(utils.servers), utils.tools),
      auto_update = true,
      run_on_start = true,
    })
  end,
}
