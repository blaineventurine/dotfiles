return {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  lazy = true,
  cmd = "Octo",
  -- event = { { event = "BufReadCmd", pattern = "octo://*" } },
  config = function()
    local octo = require("octo")

    vim.treesitter.language.register("markdown", "octo")
    -- vim.cmd([[hi OctoEditable guibg=none]])
    octo.setup({
      -- enable_builtin = true,
    })
  end,
  keys = {
    { "<localleader>a", "", desc = "+assignee (Octo)", ft = "octo" },
    { "<localleader>c", "", desc = "+comment/code (Octo)", ft = "octo" },
    { "<localleader>l", "", desc = "+label (Octo)", ft = "octo" },
    { "<localleader>i", "", desc = "+issue (Octo)", ft = "octo" },
    { "<localleader>r", "", desc = "+react (Octo)", ft = "octo" },
    { "<localleader>p", "", desc = "+pr (Octo)", ft = "octo" },
    { "<localleader>pr", "", desc = "+rebase (Octo)", ft = "octo" },
    { "<localleader>ps", "", desc = "+squash (Octo)", ft = "octo" },
    { "<localleader>v", "", desc = "+review (Octo)", ft = "octo" },
    { "<localleader>g", "", desc = "+goto_issue (Octo)", ft = "octo" },
    { "@", "@<C-x><C-o>", mode = "i", ft = "octo", silent = true },
    { "#", "#<C-x><C-o>", mode = "i", ft = "octo", silent = true },

  }
}
