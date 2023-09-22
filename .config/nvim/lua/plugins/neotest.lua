return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'antoinemadec/FixCursorHold.nvim',
    'haydenmeade/neotest-jest',
    'olimorris/neotest-rspec',
  },
  lazy = true,
  config = function()
    require('neotest').setup({
      icons = {
        expanded = '',
        child_prefix = '',
        child_indent = '',
        final_child_prefix = '',
        non_collapsible = '',
        collapsed = '',

        passed = '',
        running = '',
        failed = '',
        unknown = '',
      },
      adapters = {
        require('neotest-rspec')({
          rspec_cmd = function()
            return vim.tbl_flatten({
              -- 'backend/bin/bundle',
              'bundle',
              'exec',
              'rspec',
            })
          end,
          -- root_files = { 'Gemfile', '.rspec' },
          -- filter_dirs = { '.git', 'node_modules' },
          -- transform_spec_path = function(path)
          --   return path
          -- end,
          -- results_path = function()
          --   return async.fn.tempname()
          -- end,
        }),
        require('neotest-jest')({
          jestCommand = 'npm test --',
          jestConfigFile = function()
            local file = vim.fn.expand('%:p')
            if string.find(file, '/packages/') then
              return string.match(file, '(.-/[^/]+/)src') .. 'jest.config.ts'
            end

            return vim.fn.getcwd() .. '/jest.config.ts'
          end,
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      },
    })
  end,
}
