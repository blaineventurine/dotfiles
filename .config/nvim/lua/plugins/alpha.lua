return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local status_ok, alpha = pcall(require, 'alpha')
    if not status_ok then
      return
    end

    local dashboard = require('alpha.themes.dashboard')

    local function button(sc, txt, keybind, keybind_opts)
      local b = dashboard.button(sc, txt, keybind, keybind_opts)
      b.opts.hl = 'Function'
      b.opts.hl_shortcut = 'Type'
      return b
    end

    dashboard.section.header.val = {}
   -- TODO: fix icons here to use icons table
    dashboard.section.buttons.val = {
      button('e', '  New file', ':ene <BAR> startinsert <CR>'),
      button('o', 'ﭯ  Recently opened files', ':Telescope oldfiles<CR>'),
      button('f', '  Find file', ":lua require('plugins.telescope').project_files()<CR>"),
      button('p', '  Find project', ":lua require('telescope').extensions.project.project{}<CR>"),
      button('r', '󰀬  Find word', ":lua require('telescope.builtin').live_grep()<CR>"),
      button('g', '  Find modified file', ":lua require('plugins.telescope').my_git_status()<CR>"),
      button('t', '  Show todo', ':TodoTelescope<CR>'),
      -- button("s", "  Show plugins", ":e ~/.config/nvim/lua/plugins.lua<CR>"),
      -- button("u", "  Sync plugins", ":PackerSync<CR>"),
      -- button("l", "λ  Update laguage servers", ":LspUpdate<CR>"),
      -- button("i", "  Install Language servers", ":LspInstall<CR>"),
      button('q', '  Quit', '<Cmd>qa<CR>'),
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
