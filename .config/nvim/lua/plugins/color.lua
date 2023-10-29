return {
  {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      if vim.fn.has('termguicolors') == 1 then
        -- vim.go.t_8f = '[[38;2;%lu;%lu;%lum'
        -- vim.go.t_8b = '[[48;2;%lu;%lu;%lum'
        vim.opt.termguicolors = true
      end
      vim.cmd([[colorscheme tokyonight]])
    end,
    opts = function()
      return {
        style = 'moon',
        sidebars = {
          'qf',
          'vista_kind',
          'terminal',
        },
      }
    end,
  },
}
