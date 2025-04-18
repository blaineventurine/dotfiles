local root_patterns = { '.git', '.clang-format', 'pyproject.toml', 'setup.py' }
local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])

return {
  'philosofonusus/ecolog.nvim',
  dependencies = {
    'hrsh7th/nvim-cmp',
  },
  lazy = false,
  opts = {
    integrations = {
      -- WARNING: for both cmp integrations see readme section below
      nvim_cmp = true, -- If you dont plan to use nvim_cmp set to false, enabled by default
      lsp = true,
    },
    -- Enables shelter mode for sensitive values
    -- shelter = {
    --   configuration = {
    --     -- Partial mode configuration:
    --     -- false: completely mask values (default)
    --     -- true: use default partial masking settings
    --     -- table: customize partial masking
    --     partial_mode = false,
    --     -- or with custom settings:
    --     -- partial_mode = {
    --     --   show_start = 3, -- Show first 3 characters
    --     --   show_end = 3, -- Show last 3 characters
    --     --   min_mask = 3, -- Minimum masked characters
    --     -- },
    --     -- mask_char = '*', -- Character used for masking
    -- },
    --   modules = {
    --     cmp = true, -- Enabled to mask values in completion
    --     peek = false, -- Enable to mask values in peek view
    --     files = true, -- Enabled to mask values in file buffers
    --     telescope = false, -- Enable to mask values in telescope integration
    --     telescope_previewer = false, -- Enable to mask values in telescope preview buffers
    --     fzf = false, -- Enable to mask values in fzf picker
    --     fzf_previewer = false, -- Enable to mask values in fzf preview buffers
    --     snacks_previewer = false, -- Enable to mask values in snacks previewer
    --     snacks = false, -- Enable to mask values in snacks picker
    --   },
    -- },
    -- true by default, enables built-in types (database_url, url, etc.)
    types = true,
    path = vim.fn.getcwd(), -- Path to search for .env files
    preferred_environment = 'development', -- Optional: prioritize specific env files
    -- Controls how environment variables are extracted from code and how cmp works
    provider_patterns = true, -- true by default, when false will not check provider patterns
    load_shell = true,
    -- env_file_pattern = {
    --   '^backend/.+%.env$', -- Matches .env files in config directory
    --   -- "^environments/.+%.env$" -- Matches .env files in environments directory
    -- },
  },
}
