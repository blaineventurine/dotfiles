local wk = require('which-key')

-- ── Leader mappings ────────────────────────────────────────────────────────────
wk.add({
  { '<leader><leader>', '<C-^>', desc = 'Switch to last buffer' },

  -- Buffers
  { '<leader>b',  group = 'Buffers' },
  { '<leader>bb', '<cmd>lua require("telescope.builtin").buffers()<CR>',  desc = 'Find open buffer' },
  { '<leader>bc', '<cmd>Bwipeout<CR>',                                    desc = 'Close current buffer' },
  { '<leader>bd', '<cmd>BufferLineCloseOthers<CR>',                       desc = 'Close other buffers' },
  { '<leader>bp', '<cmd>BufferLinePick<CR>',                              desc = 'Pick buffer' },

  -- Commands / find
  { '<leader>c', '<cmd>lua require("telescope.builtin").commands()<CR>', desc = 'Find command' },

  -- Debug (DAP)
  { '<leader>d',  group = 'Debug' },
  { '<leader>db', '<cmd>lua require("dap").toggle_breakpoint()<CR>', desc = 'Toggle breakpoint' },

  -- DBee (uppercase avoids the Debug group conflict)
  { '<leader>D', '<cmd>lua require("dbee").toggle()<CR>', desc = 'Toggle DBee' },

  -- Resume last telescope search
  { '<leader>e', '<cmd>lua require("telescope.builtin").resume()<CR>', desc = 'Resume last Telescope search' },

  -- Find files
  { '<leader>f', '<cmd>lua require("telescope.builtin").find_files()<CR>', desc = 'Find file by name' },

  -- Git
  { '<leader>g',   group = 'Git' },
  { '<leader>gb',  '<cmd>GhBlameCurrentLine<CR>',                                                          desc = 'Blame current line' },
  { '<leader>gc',  '<cmd>lua require("utils.custom-telescope-commands").my_git_commits()<CR>',             desc = 'Show commits' },
  { '<leader>gd',  group = 'Diff' },
  { '<leader>gdc', '<cmd>DiffviewClose<CR>',                                                               desc = 'Close Diffview' },
  { '<leader>gdf', '<cmd>DiffviewFileHistory %<CR>',                                                       desc = 'File history' },
  { '<leader>gdo', '<cmd>DiffviewOpen<CR>',                                                                desc = 'Open Diffview' },
  { '<leader>gg',  '<cmd>LazyGit<CR>',                                                                     desc = 'LazyGit' },
  { '<leader>gh',  group = 'Hunks' },
  { '<leader>gi',  '<cmd>Octo issue list<CR>',                                                             desc = 'List issues' },
  { '<leader>gI',  '<cmd>Octo issue search<CR>',                                                           desc = 'Search issues' },
  { '<leader>gp',  '<cmd>Octo pr list<CR>',                                                                desc = 'List PRs' },
  { '<leader>gP',  '<cmd>Octo pr search<CR>',                                                              desc = 'Search PRs' },
  { '<leader>gr',  '<cmd>Octo repo list<CR>',                                                              desc = 'List repos' },
  { '<leader>gs',  '<cmd>lua require("utils.custom-telescope-commands").my_git_status()<CR>',              desc = 'Show git status' },
  { '<leader>gS',  '<cmd>Octo search<CR>',                                                                 desc = 'Search (Octo)' },

  -- Buffer cycling
  { '<leader>h', '<cmd>CybuPrev<CR>', desc = 'Previous buffer' },
  { '<leader>l', '<cmd>CybuNext<CR>', desc = 'Next buffer' },

  -- Marks
  { '<leader>m', '<cmd>lua require("telescope.builtin").marks()<CR>', desc = 'Find marks' },

  -- Notes (pure action — no sub-group collision)
  { '<leader>n', '<cmd>lua require("utils.custom-telescope-commands").my_note()<CR>', desc = 'Search notes' },

  -- NPM / package-info (uppercase N keeps <leader>n free as an action)
  { '<leader>N',  group = 'NPM' },
  { '<leader>Ni', '<cmd>lua require("package-info").install()<CR>',            desc = 'Install package' },
  { '<leader>Nm', '<cmd>Dispatch npm start<CR>',                               desc = 'Run npm start' },
  { '<leader>Np', '<cmd>lua require("package-info").change_version()<CR>',     desc = 'Change package version' },

  -- Search open files
  { '<leader>o', '<cmd>lua require("telescope.builtin").live_grep({grep_open_files=true})<CR>', desc = 'Search open files' },

  -- Projects
  { '<leader>p', '<cmd>lua require("telescope").extensions.project.project{}<CR>', desc = 'Switch project' },

  -- Find inside files (live grep with args)
  {
    '<leader>r',
    function()
      require('telescope').extensions.live_grep_args.live_grep_args({
        vimgrep_arguments = {
          'rg', '--hidden', '-L', '--color=never',
          '--no-heading', '--with-filename', '--line-number',
          '--column', '--smart-case',
        },
      })
    end,
    desc = 'Find inside files',
  },

  -- Sessions
  { '<leader>s', '<cmd>lua require("sessionable").SearchSession()<CR>', desc = 'Find session' },

  -- Terminal (pure action — no sub-group collision with <leader>T)
  { '<leader>t', '<cmd>lua require("FTerm").toggle()<CR>', desc = 'Toggle terminal' },

  -- TODOs (moved out of <leader>to to free the t prefix as a clean action)
  { '<leader>T', '<cmd>TodoTelescope<CR>', desc = 'Show all TODOs' },

  -- Undos
  { '<leader>u', '<cmd>Telescope undo<CR>', desc = 'Show undos' },

  -- Vertical split
  { '<leader>v', '<cmd>vsplit<CR>', desc = 'Vertical split' },

  -- Clipboard history
  { '<leader>y', '<cmd>Telescope neoclip<CR>', desc = 'Search clipboard' },
})

-- ── Normal mode — misc ─────────────────────────────────────────────────────────
wk.add({
  { '<',  '<<',                                 desc = 'Indent left',          mode = 'n', remap = true },
  { '>',  '>>',                                 desc = 'Indent right',         mode = 'n', remap = true },
  { '+',  '<C-a>',                              desc = 'Increment number',     mode = 'n', noremap = true, silent = true },
  { '-',  '<C-x>',                              desc = 'Decrement number',     mode = 'n', noremap = true, silent = true },
  { 'j',  'gj',                                 desc = 'Down (wrapped lines)', mode = 'n', noremap = true, silent = true },
  { 'k',  'gk',                                 desc = 'Up (wrapped lines)',   mode = 'n', noremap = true, silent = true },
  { 'q:', '<cmd>Telescope command_history<CR>', desc = 'Command history',      mode = 'n', remap = true },
  { 'ss', 'ysiW',                               desc = 'Surround word',        mode = 'n', remap = true },
  { '<C-e>', '<cmd>Neotree toggle<CR>',          desc = 'Toggle file tree',     mode = 'n' },
  { '<C-b>', '<cmd>Neotree toggle buffers<CR>',  desc = 'Toggle buffer tree',   mode = 'n' },
  { '\\', '<cmd>Neotree reveal<CR>',            desc = 'Reveal in file tree',  mode = 'n' },
  { 'z',  group = 'Folds',                      mode = 'n', remap = true },
  { 'zc', '<cmd>foldclose<CR>',                 desc = 'Close fold',           mode = 'n', remap = true },
  { 'zo', '<cmd>foldopen<CR>',                  desc = 'Open fold',            mode = 'n', remap = true },
})

-- ── Move.nvim ──────────────────────────────────────────────────────────────────
wk.add({
  { '<A-j>', '<cmd>MoveLine(1)<CR>',    desc = 'Move line down',    mode = 'n', noremap = true, silent = true },
  { '<A-k>', '<cmd>MoveLine(-1)<CR>',   desc = 'Move line up',      mode = 'n', noremap = true, silent = true },
  { '<A-l>', '<cmd>MoveHChar(1)<CR>',   desc = 'Move char right',   mode = 'n', noremap = true, silent = true },
  { '<A-h>', '<cmd>MoveHChar(-1)<CR>',  desc = 'Move char left',    mode = 'n', noremap = true, silent = true },
  { '<A-j>', '<cmd>MoveBlock(1)<CR>',   desc = 'Move block down',   mode = 'v', noremap = true, silent = true },
  { '<A-k>', '<cmd>MoveBlock(-1)<CR>',  desc = 'Move block up',     mode = 'v', noremap = true, silent = true },
  { '<A-l>', '<cmd>MoveHBlock(1)<CR>',  desc = 'Move block right',  mode = 'v', noremap = true, silent = true },
  { '<A-h>', '<cmd>MoveHBlock(-1)<CR>', desc = 'Move block left',   mode = 'v', noremap = true, silent = true },
})

-- ── DAP F-key mappings ─────────────────────────────────────────────────────────
wk.add({
  { '<F5>',  '<cmd>lua require("dap").continue()<CR>',  desc = 'DAP: Continue',   mode = 'n', silent = true },
  { '<F10>', '<cmd>lua require("dap").step_over()<CR>',  desc = 'DAP: Step over',  mode = 'n', silent = true },
  { '<F11>', '<cmd>lua require("dap").step_into()<CR>',  desc = 'DAP: Step into',  mode = 'n', silent = true },
  { '<F12>', '<cmd>lua require("dap").step_out()<CR>',   desc = 'DAP: Step out',   mode = 'n', silent = true },
})

-- ── LSP / Space mappings ───────────────────────────────────────────────────────
wk.add({
  { '<space>,', '<cmd>lua vim.diagnostic.goto_prev()<CR>',  desc = 'Previous diagnostic' },
  { '<space>:', '<cmd>lua vim.diagnostic.goto_next()<CR>',  desc = 'Next diagnostic' },
  { '<space>?', '<cmd>lua vim.diagnostic.open_float()<CR>', desc = 'Show diagnostics' },
  { '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>',   desc = 'Code actions' },
  {
    '<space>c',
    function()
      local path = vim.fn.expand('%:p')
      vim.fn.setreg('+', path)
      vim.notify('Copied "' .. path .. '" to the clipboard!')
    end,
    desc = 'Copy file path',
  },
  { '<space>d', function() vim.lsp.buf.definition() end,    desc = 'Go to definition' },
  {
    '<space>f',
    function()
      require('conform').format({ async = true, lsp_format = 'fallback' })
    end,
    desc = 'Format buffer',
  },
  { '<space>h', '<cmd>lua vim.lsp.buf.hover()<CR>',            desc = 'Hover info' },
  { '<space>m', '<cmd>lua vim.lsp.buf.rename()<CR>',           desc = 'Rename symbol' },
  { '<space>r', '<cmd>Telescope lsp_references<CR>',           desc = 'References' },
  { '<space>s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',  desc = 'Document symbols' },

  -- Neotest
  { '<space>t',  group = 'Test' },
  { '<space>tF', '<cmd>lua require("neotest").run.run({vim.fn.expand("%"), strategy = "dap"})<CR>', desc = 'Debug file' },
  { '<space>tL', '<cmd>lua require("neotest").run.run_last({ strategy = "dap" })<CR>',              desc = 'Debug last' },
  { '<space>tN', '<cmd>lua require("neotest").run.run({strategy = "dap"})<CR>',                     desc = 'Debug nearest' },
  { '<space>tS', '<cmd>lua require("neotest").run.stop()<CR>',                                      desc = 'Stop' },
  { '<space>ta', '<cmd>lua require("neotest").run.attach()<CR>',                                    desc = 'Attach' },
  { '<space>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',                     desc = 'Run file' },
  { '<space>tl', '<cmd>lua require("neotest").run.run_last()<CR>',                                  desc = 'Run last' },
  { '<space>tn', '<cmd>lua require("neotest").run.run()<CR>',                                       desc = 'Run nearest' },
  { '<space>to', '<cmd>lua require("neotest").output.open({ enter = true })<CR>',                   desc = 'Show output' },
  { '<space>ts', '<cmd>lua require("neotest").summary.toggle()<CR>',                                desc = 'Toggle summary' },
})

-- ── Insert mode ────────────────────────────────────────────────────────────────
wk.add({
  { 'jk', '<ESC>', desc = 'Exit insert mode', mode = 'i', noremap = true },
})

-- ── Visual mode ────────────────────────────────────────────────────────────────
wk.add({
  { '<', '<gv', desc = 'Indent left',  mode = 'v' },
  { '>', '>gv', desc = 'Indent right', mode = 'v' },
})

-- ── Terminal mode ──────────────────────────────────────────────────────────────
wk.add({
  { '<leader>t', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', desc = 'Close terminal', mode = 't' },
})

-- ── Command mode ───────────────────────────────────────────────────────────────
wk.add({
  { 'bd', 'Bwipeout', desc = 'Close buffer', mode = 'c' },
  { 'bw', 'Bwipeout', desc = 'Close buffer', mode = 'c' },
})

-- ── HlsLens search navigation ──────────────────────────────────────────────────
-- n/N are remapped in nvim-ufo.lua to integrate hlslens with fold preview.
-- Only the non-fold variants need wiring here.
vim.keymap.set('n', '*',  "*<Cmd>lua require('hlslens').start()<CR>",  { noremap = true })
vim.keymap.set('n', '#',  "#<Cmd>lua require('hlslens').start()<CR>",  { noremap = true })
vim.keymap.set('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.keymap.set('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
