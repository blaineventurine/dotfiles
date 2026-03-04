return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPost', 'BufWritePost' },
  config = function()
    local lint = require('lint')
    local custom_dict_path = vim.fn.stdpath('config') .. '/spell/en.utf-8.add'

    lint.linters_by_ft = {
      yaml       = { 'actionlint', 'yamllint' },
      proto      = { 'buf' },
      python     = { 'flake8', 'mypy' },
      dockerfile = { 'hadolint' },
      haml       = { 'haml_lint' },
      markdown   = { 'markdownlint', 'codespell' },
      text       = { 'codespell' },
      gitcommit  = { 'codespell' },
    }

    -- Preserve flake8 args from none-ls config
    lint.linters.flake8 = vim.tbl_deep_extend('force', lint.linters.flake8, {
      args = {
        '--max-line-length=120',
        '--ignore=R,duplicate-code,W0231,W0511,W1201,W1202,W0707,C0301,no-init',
        '--format=%(path)s:%(row)d:%(col)d: %(code)s %(text)s',
        '--stdin-display-name', vim.api.nvim_buf_get_name(0),
        '-',
      },
    })

    -- Preserve codespell custom dict from none-ls config
    lint.linters.codespell = vim.tbl_deep_extend('force', lint.linters.codespell, {
      args = { '--ignore-words', custom_dict_path },
    })

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
      callback = function()
        lint.try_lint()
        local ft = vim.bo.filetype
        if ft == 'markdown' or ft == 'text' then
          lint.try_lint('vale')
        end
      end,
    })
  end,
}
