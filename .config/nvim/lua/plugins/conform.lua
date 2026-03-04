return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = 'ConformInfo',
  config = function()
    require('conform').setup({
      formatters_by_ft = {
        lua             = { 'stylua' },
        python          = { 'isort', 'black' },
        go              = { 'goimports', 'gofumpt' },
        javascript      = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript      = { 'prettier' },
        typescriptreact = { 'prettier' },
        css             = { 'prettier' },
        html            = { 'prettier' },
        json            = { 'jq' },
        markdown        = { 'markdownlint' },
        sh              = { 'shellharden' },
        bash            = { 'shellharden' },
        yaml            = { 'prettier' },
      },
      formatters = {
        black = { prepend_args = { '--line-length=100' } },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },
    })
  end,
}
