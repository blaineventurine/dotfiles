return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  event = 'VeryLazy',
  config = function()
    require('typescript-tools').setup({
      expose_as_code_action = 'all'
    })
  end
}
