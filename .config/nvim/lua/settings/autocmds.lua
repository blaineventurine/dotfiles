local function augroup(name)
  return vim.api.nvim_create_augroup('group_' .. name, { clear = true })
end
local aucmd = vim.api.nvim_create_autocmd

-- Set the working directory to that of the opened file
aucmd('BufEnter', {
  group = augroup('set_cwd'),
  callback = function()
    local cwd = vim.fn.expand('%:p:h')
    if cwd ~= '' then
      vim.cmd('lcd ' .. cwd)
    end
  end,
})

aucmd('BufEnter', {
  pattern = { '*.sh', '*.zsh' },
  group = augroup('zsh_as_bash'),
  command = 'silent! set filetype=sh',
})

-- aucmd('FileType', {
--   pattern = { 'eruby.yaml' },
--   group = augroup('eruby_as_yaml'),
--   command = 'silent! set filetype=yaml',
-- })

-- Check if we need to reload the file when it changed
aucmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup('checktime'),
  command = 'checktime',
})

-- Highlight on yank
aucmd('TextYankPost', {
  group = augroup('highlight_yank'),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
aucmd({ 'VimResized' }, {
  group = augroup('resize_splits'),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd('tabdo wincmd =')
    vim.cmd('tabnext ' .. current_tab)
  end,
})

-- go to last location when opening a buffer
aucmd('BufReadPost', {
  group = augroup('last_loc'),
  callback = function()
    local exclude = { 'gitcommit' }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
aucmd('FileType', {
  group = augroup('close_with_q'),
  pattern = {
    'PlenaryTestPopup',
    'checkhealth',
    'help',
    'lspinfo',
    'man',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
aucmd('FileType', {
  group = augroup('wrap_spell'),
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
aucmd({ 'BufWritePre' }, {
  group = augroup('auto_create_dir'),
  callback = function(event)
    if event.match:match('^%w%w+://') then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})

-- Disable diagnostics in a .env file
aucmd({ 'BufRead' }, {
  pattern = '.env',
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

-- Disable next line comments
aucmd({ 'BufEnter' }, {
  callback = function()
    vim.cmd('set formatoptions-=cro')
    vim.cmd('setlocal formatoptions-=cro')
  end,
})

-- Disable eslint on node_modules
aucmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('DisableEslintOnNodeModules'),
  pattern = { '**/node_modules/**', 'node_modules', '/node_modules/*' },
  callback = function()
    vim.diagnostic.enable(false)
  end,
})

-- local jqx = vim.api.nvim_create_augroup("Jqx", {})
-- vim.api.nvim_clear_autocmds({ group = jqx })
-- aucmd("BufWinEnter", {
--   pattern = { "*.json", "*.yaml" },
--   desc = "preview json and yaml files on open",
--   group = jqx,
--   callback = function()
--     vim.cmd.JqxList()
--   end,
-- })

-- Don't list quick list in buffer list and so bnext etc dont toggle to it
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('qf'),
  pattern = 'qf',
  callback = function()
    vim.cmd('set nobuflisted')
  end,
})
