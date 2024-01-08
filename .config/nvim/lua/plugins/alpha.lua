return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local status_ok, alpha = pcall(require, 'alpha')
    if not status_ok then
      return
    end

    local dashboard = require('alpha.themes.dashboard')
    local icons = require('utils.icons').general

    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl = 'Function'
      b.opts.hl_shortcut = 'Type'
      return b
    end

    dashboard.section.header.val = {}
    dashboard.section.buttons.val = {
      button('e', icons.NewFile .. ' New file', ':ene <BAR> startinsert <CR>'),
      button('o', icons.History .. ' Recently opened files', ':Telescope oldfiles<CR>'),
      button('f', icons.Search .. ' Find file', ":lua require('plugins.telescope').project_files()<CR>"),
      button('p', icons.FolderFilled .. ' Find project', ":lua require('telescope').extensions.project.project{}<CR>"),
      button('g', icons.Octocat .. ' Find modified file', ":lua require('plugins.telescope').my_git_status()<CR>"),
      button('t', icons.Todo .. ' Show todo', ':TodoTelescope<CR>'),
      button('q', icons.Close .. ' Quit', '<Cmd>qa<CR>'),
    }

    local v = vim.version()
    local version = ' v' .. v.major .. '.' .. v.minor .. '.' .. v.patch

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
          '',
          version .. '     ' .. '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms',
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    dashboard.section.footer.val = {}

    dashboard.section.footer.opts.hl = 'Constant'
    dashboard.section.header.opts.hl = 'Include'
    dashboard.section.buttons.opts.hl = 'Keyword'

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)
  end,
}
