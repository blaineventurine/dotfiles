local wk = require('which-key')
local key = vim.api.nvim_set_keymap
local silent_no_remap = { noremap = true, silent = true }
local noremap = { noremap = true }

-- normal mode mappings
wk.add(
  {
    { "<leader><leader>", "<C-^>",                                                                       desc = "Switch to last used buffer" },
    { "<leader>b",        group = "Buffers" },
    { "<leader>bb",       "<cmd>lua require('telescope.builtin').buffers()<CR>",                         desc = "Find open buffer" },
    { "<leader>bc",       "<cmd>BufferClose<CR>",                                                        desc = "Close current buffer" },
    { "<leader>bd",       "<cmd>BufferCloseAllButCurrent<CR>",                                           desc = "Close all other buffers" },
    { "<leader>bp",       "<cmd>BufferPick<CR>",                                                         desc = "Pick buffer" },
    { "<leader>c",        "<cmd>lua require('telescope.builtin').commands()<CR>",                        desc = "Find command" },
    { "<leader>d",        "<cmd>lua require('dbee').toggle()<CR>",                                       desc = "Toggle DBee" },
    { "<leader>e",        "<cmd>lua require('telescope.builtin').resume()<CR>",                          desc = "Resume last Telescope search" },
    { "<leader>f",        "<cmd>lua require('telescope.builtin').find_files()<CR>",                      desc = "Find file by name" },
    { "<leader>g",        group = "Git" },
    { "<leader>gc",       "<cmd>lua require('utils.custom-telescope-commands').my_git_commits()<CR>",    desc = "Show commits" },
    { "<leader>gd",       desc = "+Diff" },
    { "<leader>gdf",      "<cmd>DiffviewFileHistory %<CR>",                                              desc = "History for current file" },
    { "<leader>gdo",      "<cmd>DiffviewOpen<CR>",                                                       desc = "Open Diffview" },
    { "<leader>gg",       "<cmd>LazyGit<CR>",                                                            desc = "LazyGit" },
    { "<leader>gh",       group = "Github" },
    { "<leader>ghc",      group = "Commits" },
    { "<leader>ghcc",     "<cmd>GHCloseCommit<cr>",                                                      desc = "Close" },
    { "<leader>ghce",     "<cmd>GHExpandCommit<cr>",                                                     desc = "Expand" },
    { "<leader>ghco",     "<cmd>GHOpenToCommit<cr>",                                                     desc = "Open To" },
    { "<leader>ghcp",     "<cmd>GHPopOutCommit<cr>",                                                     desc = "Pop Out" },
    { "<leader>ghcz",     "<cmd>GHCollapseCommit<cr>",                                                   desc = "Collapse" },
    { "<leader>ghi",      group = "Issues" },
    { "<leader>ghio",     "<cmd>GHOpenIssue<cr>",                                                        desc = "Open" },
    { "<leader>ghip",     "<cmd>GHPreviewIssue<cr>",                                                     desc = "Preview" },
    { "<leader>ghl",      group = "Litee" },
    { "<leader>ghlt",     "<cmd>LTPanel<cr>",                                                            desc = "Toggle Panel" },
    { "<leader>ghp",      group = "Pull Request" },
    { "<leader>ghpc",     "<cmd>GHClosePR<cr>",                                                          desc = "Close" },
    { "<leader>ghpd",     "<cmd>GHPRDetails<cr>",                                                        desc = "Details" },
    { "<leader>ghpe",     "<cmd>GHExpandPR<cr>",                                                         desc = "Expand" },
    { "<leader>ghpo",     "<cmd>GHOpenPR<cr>",                                                           desc = "Open" },
    { "<leader>ghpp",     "<cmd>GHPopOutPR<cr>",                                                         desc = "PopOut" },
    { "<leader>ghpr",     "<cmd>GHRefreshPR<cr>",                                                        desc = "Refresh" },
    { "<leader>ghpt",     "<cmd>GHOpenToPR<cr>",                                                         desc = "Open To" },
    { "<leader>ghpz",     "<cmd>GHCollapsePR<cr>",                                                       desc = "Collapse" },
    { "<leader>ghr",      group = "Review" },
    { "<leader>ghrb",     "<cmd>GHStartReview<cr>",                                                      desc = "Begin" },
    { "<leader>ghrc",     "<cmd>GHCloseReview<cr>",                                                      desc = "Close" },
    { "<leader>ghrd",     "<cmd>GHDeleteReview<cr>",                                                     desc = "Delete" },
    { "<leader>ghre",     "<cmd>GHExpandReview<cr>",                                                     desc = "Expand" },
    { "<leader>ghrs",     "<cmd>GHSubmitReview<cr>",                                                     desc = "Submit" },
    { "<leader>ghrz",     "<cmd>GHCollapseReview<cr>",                                                   desc = "Collapse" },
    { "<leader>ght",      group = "Threads" },
    { "<leader>ghtc",     "<cmd>GHCreateThread<cr>",                                                     desc = "Create" },
    { "<leader>ghtn",     "<cmd>GHNextThread<cr>",                                                       desc = "Next" },
    { "<leader>ghtt",     "<cmd>GHToggleThread<cr>",                                                     desc = "Toggle" },
    { "<leader>gs",       "<cmd>lua require('utils.custom-telescope-commands').my_git_status()<CR>",     desc = "Show git status" },
    { "<leader>h",        "<cmd>CybuPrev<CR>",                                                           desc = "Switch to previous buffer in list" },
    { "<leader>l",        "<cmd>CybuNext<CR>",                                                           desc = "Switch to next buffer in list" },
    { "<leader>m",        "<cmd>lua require('telescope.builtin').marks()<CR>",                           desc = "Find marks" },
    { "<leader>n",        "<cmd>lua require('utils.custom-telescope-commands').my_note()<CR>",           desc = "Search notes" },
    { "<leader>ni",       "<cmd>lua require('package-info').install()<cr>",                              desc = "Install package" },
    { "<leader>nm",       "<cmd>Dispatch npm start",                                                     desc = "Run NPM" },
    { "<leader>np",       "<cmd>lua require('package-info').change_version()<cr>",                       desc = "Change package version" },
    { "<leader>o",        "<cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>", desc = "Search within open files" },
    { "<leader>p",        "<cmd>lua require('telescope').extensions.project.project{}<CR>",              desc = "Find file in different project" },
    {
      "<leader>r",
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
      desc = "Find inside files"
    },
    { "<leader>s",  "<cmd>lua require('sessionable').SearchSession()<CR>", desc = "Find a session" },
    { "<leader>t",  "<cmd>lua require('FTerm').toggle()<CR>",              desc = "Toggle terminal" },
    { "<leader>to", "<cmd>TodoTelescope<CR>",                              desc = "Show all TODOs" },
    { "<leader>v",  "<cmd>vsplit<CR>",                                     desc = "Vertical split" },
    { "<leader>y",  "<cmd>Telescope neoclip<CR>",                          desc = "Search clipboard, <C-p> to paste" },

  })

wk.add({
  { "<",  "<<",                                 desc = "Indent left",                          remap = true },
  { ">",  ">>",                                 desc = "Indent right",                         remap = true },
  { "q:", "<cmd>Telescope command_history<CR>", desc = "Search command history",               remap = true },
  { "ss", "ysiW",                               desc = "Surround current word with character", remap = true },
  { "z",  group = "Folds",                      remap = true },
  { "zc", "<cmd>foldclose<CR>",                 desc = "Close fold",                           remap = true },
  { "zo", "<cmd>foldopen<CR>",                  desc = "Open fold",                            remap = true },
}, { noremap = false })


wk.add({
  { "<space>,", "<cmd>lua vim.diagnostic.goto_prev()<CR>",  desc = "Go to previous diagnostic issue" },
  { "<space>:", "<cmd>lua vim.diagnostic.goto_next()<CR>",  desc = "Go to next diagnostic issue" },
  { "<space>?", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Show code diagnostics" },
  { "<space>a", "<cmd>lua vim.lsp.buf.code_action()<CR>",   desc = "Autofix diagnostic issue" },
  {
    "<space>c",
    function()
      local path = vim.fn.expand("%:p")
      vim.fn.setreg("+", path)
      vim.notify('Copied "' .. path .. '" to the clipboard!')
    end,
    desc = "Copy file path to clipboard"
  },
  {
    "<space>d",
    function()
      local file_type = vim.bo.filetype
      print(file_type)
      if file_type == 'typescript' or file_type == 'typescriptreact' then
        vim.cmd([[:TSToolsGoToSourceDefinition]])
      else
        vim.cmd([[lua vim.lsp.buf.definition()]])
      end
    end,
    desc = "Go to definition"
  },
  {
    "<space>f",
    function()
      local file_type = vim.bo.filetype
      if file_type == 'typescript' or file_type == 'typescriptreact' or file_type == 'javascript' or file_type == 'javascriptreact' then
        vim.cmd([[:EslintFixAll]])
      else
        vim.cmd([[lua vim.lsp.buf.format({timeout_ms = 2000})]])
      end
    end,
    desc = "Format buffer"
  },
  { "<space>h",  "<cmd>lua vim.lsp.buf.hover()<CR>",                                                desc = "Show hover info" },
  { "<space>m",  "<cmd>lua vim.lsp.buf.rename()<CR>",                                               desc = "Rename item" },
  { "<space>r",  "<cmd>Telescope lsp_references<CR>",                                               desc = "Show references" },
  { "<space>s",  "<cmd>lua vim.lsp.buf.document_symbol()<CR>",                                      desc = "Show document symbol" },
  { "<space>t",  group = "Neotest" },
  { "<space>tF", "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", desc = "Debug File" },
  { "<space>tL", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>",              desc = "Debug Last" },
  { "<space>tN", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",                     desc = "Debug Nearest" },
  { "<space>tS", "<cmd>lua require('neotest').run.stop()<cr>",                                      desc = "Stop" },
  { "<space>ta", "<cmd>lua require('neotest').run.attach()<cr>",                                    desc = "Attach" },
  { "<space>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>",                     desc = "Run File" },
  { "<space>tl", "<cmd>lua require('neotest').run.run_last()<cr>",                                  desc = "Run Last" },
  { "<space>tn", "<cmd>lua require('neotest').run.run()<cr>",                                       desc = "Run Nearest" },
  { "<space>to", "<cmd>lua require('neotest').output.open({ enter = true })<cr>",                   desc = "Output" },
  { "<space>ts", "<cmd>lua require('neotest').summary.toggle()<cr>",                                desc = "Summary" },
})

-- terminal mode mappings
wk.add({
  { "<leader>t", "<C-\\><C-n><CMD>lua require('FTerm').toggle()<CR>", desc = "Toggle terminal closed", mode = "t" },
}, { mode = 't' })

-- visual mode mappings
wk.add({
  { "<", "<gv", desc = "Indent left",  mode = "v" },
  { ">", ">gv", desc = "Indent right", mode = "v" },
}, { mode = 'v' })

-- command mode mappings
wk.add({
  { "bd", "Bwipeout", desc = "Close buffer", mode = "c" },
  { "bw", "Bwipeout", desc = "Close buffer", mode = "c" },
}, { mode = 'c', silent = true })

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
key('n', '<C-b>', ':Neotree toggle buffers<CR>', { noremap = false })
-- General
key('i', 'jk', '<ESC>', noremap)
-- increment/decrement numbers
key('n', '+', '<c-a>', silent_no_remap)
key('n', '-', '<c-x>', silent_no_remap)
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
