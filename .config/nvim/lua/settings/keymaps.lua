local wk = require('which-key')
local key = vim.api.nvim_set_keymap
local silent_no_remap = { noremap = true, silent = true }
local noremap = { noremap = true }

-- normal mode mappings
wk.register({
  ['<leader>'] = {
    ['<leader>'] = { '<C-^>', 'Switch to last used buffer' },
    b = {
      name = '+Buffers',
      b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", 'Find open buffer' },
      c = { '<cmd>BufferClose<CR>', 'Close current buffer' },
      d = { '<cmd>BufferCloseAllButCurrent<CR>', 'Close all other buffers' },
      p = { '<cmd>BufferPick<CR>', 'Pick buffer' },
    },
    c = { "<cmd>lua require('telescope.builtin').commands()<CR>", 'Find command' },
    e = { "<cmd>lua require('telescope.builtin').resume()<CR>", 'Resume last Telescope search' },
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", 'Find file by name' },
    g = {
      name = '+Git',
      c = { "<cmd>lua require('utils.custom-telescope-commands').my_git_commits()<CR>", 'Show commits' },
      d = {
        '+Diff',
        f = { '<cmd>DiffviewFileHistory %<CR>', 'History for current file' },
        c = { '<cmd>DiffviewClose<CR>', 'Open Diffview' },
        o = { '<cmd>DiffviewOpen<CR>', 'Open Diffview' },
      },
      g = { '<cmd>LazyGit<CR>', 'LazyGit' },
      h = {
        name = '+Github',
        c = {
          name = '+Commits',
          c = { '<cmd>GHCloseCommit<cr>', 'Close' },
          e = { '<cmd>GHExpandCommit<cr>', 'Expand' },
          o = { '<cmd>GHOpenToCommit<cr>', 'Open To' },
          p = { '<cmd>GHPopOutCommit<cr>', 'Pop Out' },
          z = { '<cmd>GHCollapseCommit<cr>', 'Collapse' },
        },
        i = {
          name = '+Issues',
          p = { '<cmd>GHPreviewIssue<cr>', 'Preview' },
          o = { '<cmd>GHOpenIssue<cr>', 'Open' },
        },
        l = {
          name = '+Litee',
          t = { '<cmd>LTPanel<cr>', 'Toggle Panel' },
        },
        r = {
          name = '+Review',
          b = { '<cmd>GHStartReview<cr>', 'Begin' },
          c = { '<cmd>GHCloseReview<cr>', 'Close' },
          d = { '<cmd>GHDeleteReview<cr>', 'Delete' },
          e = { '<cmd>GHExpandReview<cr>', 'Expand' },
          s = { '<cmd>GHSubmitReview<cr>', 'Submit' },
          z = { '<cmd>GHCollapseReview<cr>', 'Collapse' },
        },
        p = {
          name = '+Pull Request',
          c = { '<cmd>GHClosePR<cr>', 'Close' },
          d = { '<cmd>GHPRDetails<cr>', 'Details' },
          e = { '<cmd>GHExpandPR<cr>', 'Expand' },
          o = { '<cmd>GHOpenPR<cr>', 'Open' },
          p = { '<cmd>GHPopOutPR<cr>', 'PopOut' },
          r = { '<cmd>GHRefreshPR<cr>', 'Refresh' },
          t = { '<cmd>GHOpenToPR<cr>', 'Open To' },
          z = { '<cmd>GHCollapsePR<cr>', 'Collapse' },
        },
        t = {
          name = '+Threads',
          c = { '<cmd>GHCreateThread<cr>', 'Create' },
          n = { '<cmd>GHNextThread<cr>', 'Next' },
          t = { '<cmd>GHToggleThread<cr>', 'Toggle' },
        },
      },
      s = { "<cmd>lua require('utils.custom-telescope-commands').my_git_status()<CR>", 'Show git status' },
    },
    h = { '<cmd>CybuPrev<CR>', 'Switch to previous buffer in list' },
    -- h = { "<plug>(CybuLastusedPrev)", "" },
    -- l = { "<plug>(CybuLastusedNext)", "" },
    l = { '<cmd>CybuNext<CR>', 'Switch to next buffer in list' },
    m = { "<cmd>lua require('telescope.builtin').marks()<CR>", 'Find marks' },
    n = { "<cmd>lua require('utils.custom-telescope-commands').my_note()<CR>", 'Search notes' },
    -- TODO: update this, which-key doesn't like two letter mappings
    ni = { "<cmd>lua require('package-info').install()<cr>", 'Install package' },
    nm = { '<cmd>Dispatch npm start', 'Run NPM' },
    np = { "<cmd>lua require('package-info').change_version()<cr>", 'Change package version' },
    o = {
      "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>",
      'Search within open files',
    },
    p = { "<cmd>lua require('telescope').extensions.project.project{}<CR>", 'Find file in different project' },
    r = {
      function()
        require('telescope').extensions.live_grep_args.live_grep_args({
          vimgrep_arguments = {
            'rg',
            '--hidden',
            '-L',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },
        })
      end,
      'Find inside files',
    },
    s = { "<cmd>lua require('sessionable').SearchSession()<CR>", 'Find a session' },
    t = { "<cmd>lua require('FTerm').toggle()<CR>", 'Toggle terminal' },
    to = { '<cmd>TodoTelescope<CR>', 'Show all TODOs' },
    v = { '<cmd>vsplit<CR>', 'Vertical split' },
    -- vc = { '<cmd>close<CR>', 'Close current window' },
    y = { '<cmd>Telescope neoclip<CR>', 'Search clipboard, <C-p> to paste' },
    -- l = { "", "" },
    -- l = { "", "" },
    -- l = { "", "" },
    -- },
  },
})

wk.register({
  q = {
    [':'] = { '<cmd>Telescope command_history<CR>', 'Search command history' },
  },
  s = {
    s = { 'ysiW', 'Surround current word with character' }, -- { silent = true })
  },
  z = {
    name = '+Folds',
    c = { '<cmd>foldclose<CR>', 'Close fold' },
    o = { '<cmd>foldopen<CR>', 'Open fold' },
  },
}, { noremap = false })

wk.register({
  ['<space>'] = {
    ['?'] = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Show code diagnostics' },
    [','] = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Go to previous diagnostic issue' },
    [':'] = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Go to next diagnostic issue' },
    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Autofix diagnostic issue' },
    d = {
      function()
        local file_type = vim.bo.filetype
        print(file_type)
        if file_type == 'typescript' or file_type == 'typescriptreact' then
          vim.cmd([[:TSToolsGoToSourceDefinition]])
        else
          vim.cmd([[lua vim.lsp.buf.definition()]])
        end
      end,
      'Go to definition',
    },
    -- f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format buffer" },
    f = { '<cmd>lua vim.lsp.buf.format({timeout_ms = 2000})<CR>', 'Format buffer' },
    h = { '<cmd>lua vim.lsp.buf.hover()<CR>', 'Show hover info' },
    m = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename item' },
    r = { '<cmd>Telescope lsp_references<CR>', 'Show references' },
    s = { '<cmd>lua vim.lsp.buf.document_symbol()<CR>', 'Show document symbol' },
    t = {
      name = 'Neotest',
      a = { "<cmd>lua require('neotest').run.attach()<cr>", 'Attach' },
      f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", 'Run File' },
      F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", 'Debug File' },
      l = { "<cmd>lua require('neotest').run.run_last()<cr>", 'Run Last' },
      L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", 'Debug Last' },
      n = { "<cmd>lua require('neotest').run.run()<cr>", 'Run Nearest' },
      N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", 'Debug Nearest' },
      o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", 'Output' },
      S = { "<cmd>lua require('neotest').run.stop()<cr>", 'Stop' },
      s = { "<cmd>lua require('neotest').summary.toggle()<cr>", 'Summary' },
    },
    -- m = { "<cmd><CR>", "" },
    -- m = { "<cmd><CR>", "" },
  },
})

-- terminal mode mappings
wk.register({
  ['<leader>'] = {
    t = { "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", 'Toggle terminal closed' },
  },
}, { mode = 't' })

-- this was in the nvim-autopairs config
key('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
-- Git
-- HlsLens
key('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", silent_no_remap)
key('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", silent_no_remap)
key('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", noremap)
key('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", noremap)
key('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", noremap)
key('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", noremap)
-- Move.nvim
key('n', '<A-j>', ':MoveLine(1)<CR>', silent_no_remap)
key('n', '<A-k>', ':MoveLine(-1)<CR>', silent_no_remap)
key('v', '<A-j>', ':MoveBlock(1)<CR>', silent_no_remap)
key('v', '<A-k>', ':MoveBlock(-1)<CR>', silent_no_remap)
key('n', '<A-l>', ':MoveHChar(1)<CR>', silent_no_remap)
key('n', '<A-h>', ':MoveHChar(-1)<CR>', silent_no_remap)
key('v', '<A-l>', ':MoveHBlock(1)<CR>', silent_no_remap)
key('v', '<A-h>', ':MoveHBlock(-1)<CR>', silent_no_remap)
-- NeoTree
key('n', '<C-e>', ':Neotree toggle<CR>', { noremap = false })
-- General
key('i', 'jk', '<ESC>', noremap)
-- increment/decrement numbers
key('n', '+', '<c-a>', silent_no_remap)
key('n', '-', '<c-x>', silent_no_remap)
-- in/de-dent lines and remember the selection
key('v', '<', '<gv', silent_no_remap)
key('v', '>', '>gv', silent_no_remap)
key('v', 'H', '<gv', silent_no_remap)
key('v', 'L', '>gv', silent_no_remap)
key('n', '>', '>>', silent_no_remap)
key('n', '<', '<<', silent_no_remap)
-- Move up and down wrapped lines intuitively, not literally
key('n', 'j', 'gj', silent_no_remap)
key('n', 'k', 'gk', silent_no_remap)
-- debugging
key('n', '<F5>', ":lua require'dap'.continue()<CR>", { silent = true })
key('n', '<F10>', ":lua require'dap'.step_over()<CR>", { silent = true })
key('n', '<F11>', ":lua require'dap'.step_into()<CR>", { silent = true })
key('n', '<F12>', ":lua require'dap'.step_out()<CR>", { silent = true })
key('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })

-- key('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>')
-- key('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
-- key('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
-- key('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
-- key('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')

-- key('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
-- key('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
-- key('v', '<leader>dhv', '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

-- key('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
-- key('n', '<leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

-- key('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
-- key('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
-- key('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
-- key('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')

-- -- telescope-dap
-- key('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
-- key('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
-- key('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
-- key('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
-- key('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')
key('c', 'bd', 'Bdelete', { silent = true })
key('c', 'bw', 'Bdelete', { silent = true })
