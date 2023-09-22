local o = vim.opt
local g = vim.g
-- Global
o.backup = false
o.backupcopy = 'yes'
o.clipboard = 'unnamedplus'
o.completeopt = { 'menu', 'menuone', 'noselect' }
o.encoding = 'UTF-8'
o.errorbells = false
o.fillchars = { vert = ' ' }
o.hidden = true
o.hlsearch = true
o.ignorecase = true
o.joinspaces = false
o.lazyredraw = true
o.listchars = { tab = '>>>', trail = '·', precedes = '←', extends = '→', eol = '↲', nbsp = '␣' }
g.mapleader = ','
o.mouse = 'v'
o.scrolloff = 5
o.shortmess:append({ c = true, S = true })
o.showcmd = true
o.showmatch = true
o.showmode = false
o.showtabline = 2
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.title = true
o.undolevels = 1000
o.wrapscan = true
o.writebackup = false
-- Buffer
o.expandtab = true
o.fileformat = 'unix'
o.shiftwidth = 2
o.softtabstop = 2
o.spelllang = 'en_us'
o.swapfile = false
o.tabstop = 2
o.undofile = false
-- Window
o.colorcolumn = '+1'
o.cursorline = true
o.foldcolumn = '1'
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-- o.foldmethod = 'indent'
-- o.foldnestmax = 10
o.list = true
o.number = true
o.relativenumber = false
o.ruler = true
o.signcolumn = 'yes'
o.laststatus = 3 -- use global statusline
o.diffopt = { -- Option settings for diff mode.
  'filler', -- Show filler lines.
  'vertical', -- Start diff mode with vertical splits.
  'hiddenoff', -- Do not use diff mode for a buffer when it becomes hidden.
  'foldcolumn:0', -- Set the 'foldcolumn' option to 0.
  'algorithm:histogram', -- Use the specified diff algorithm.
}
o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal'

if vim.fn.has('nvim-0.9.0') == 1 then
  o.splitkeep = 'screen'
  o.shortmess:append({ C = true })
end
