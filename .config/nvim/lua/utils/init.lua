local M = {}

-- Mason
M.servers = {
  'bash-language-server',
  'css-lsp',
  'cssmodules-language-server',
  'diagnostic-languageserver',
  'docker-compose-language-service',
  'dockerfile-language-server',
  'erb-lint',
  'eslint-lsp',
  'gopls',
  'haml-lint',
  'html-lsp',
  'json-lsp',
  'lua-language-server',
  'ruby_lsp',
  'tailwindcss-language-server',
  'terraform-ls',
  'yaml-language-server',
}

M.linters = {
  'haml_lint',
  'jq',
  'jsonlint',
  'markdownlint',
  'prettier',
  'rubocop',
  'shellcheck',
  'shellharden',
  'stylua',
}

-- Treesitter
M.parsers = {
  'bash',
  'css',
  'dockerfile',
  'go',
  'html',
  'javascript',
  'json',
  'lua',
  'markdown',
  'markdown_inline',
  'regex',
  'ruby',
  'toml',
  'tsx',
  'typescript',
  'vim',
  'yaml',
}

return M
