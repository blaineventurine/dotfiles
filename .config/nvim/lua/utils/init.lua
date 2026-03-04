local M = {}

-- Mason
M.servers = {
  'bash-language-server',
  'css-lsp',
  'cssmodules-language-server',
  'docker-compose-language-service',
  'dockerfile-language-server',
  'eslint-lsp',
  'herb_ls',
  'html-lsp',
  'json-lsp',
  'lua-language-server',
  'ruby_lsp',
  'stimulus-language-server',
  'tailwindcss-language-server',
  'taplo',
  'terraform-ls',
  'vtsls',
  'yaml-language-server',
}

M.tools = {
  -- formatters
  'black',
  'isort',
  'gofumpt',
  'goimports',
  'jq',
  'markdownlint',
  'prettier',
  'shellharden',
  'stylua',
  -- linters
  'actionlint',
  'buf',
  'codespell',
  'flake8',
  'hadolint',
  'haml-lint',
  'mypy',
  'vale',
  'yamllint',
}

-- Treesitter
M.parsers = {
  'bash',
  'css',
  'dockerfile',
  'go',
  'gowork',
  'gomod',
  'gosum',
  'gotmpl',
  'comment',
  'html',
  'javascript',
  'json',
  'latex',
  'lua',
  'markdown',
  'markdown_inline',
  'regex',
  'rbs',
  'ruby',
  'rust',
  'sql',
  'terraform',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'yaml',
}

return M
