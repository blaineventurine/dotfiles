local M = {}

-- Mason
M.servers = {
  'bash-language-server',
  'codespell',
  'css-lsp',
  'cssmodules-language-server',
  'diagnostic-languageserver',
  'docker-compose-language-service',
  'dockerfile-language-server',
  'eslint-lsp',
  -- 'erb-lint',
  'haml-lint',
  'html-lsp',
  'json-lsp',
  'lua-language-server',
  'ruby_lsp',
  'semgrep',
  'stimulus-language-server',
  'tailwindcss-language-server',
  'taplo',
  'terraform-ls',
  'vale',
  'yaml-language-server',
}

M.linters = {
  'erb-formatter',
  -- 'erb-lint',
  'haml_lint',
  'jq',
  'jsonlint',
  'markdownlint',
  'prettier',
  'rubocop',
  'shellcheck',
  'shellharden',
  'stylua',
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
