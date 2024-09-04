return {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-dap.nvim',
    'nvim-telescope/telescope-project.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    local actions = require('telescope.actions')
    local lga_actions = require('telescope-live-grep-args.actions')
    local multiopen = function(prompt_bufnr)
      local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()

      if vim.tbl_isempty(multi) then
        require('telescope.actions').select_default(prompt_bufnr)
        return
      end

      require('telescope.actions').close(prompt_bufnr)
      for _, entry in pairs(multi) do
        local filename = entry.filename or entry.value
        local lnum = entry.lnum or 1
        local lcol = entry.col or 1
        if filename then
          vim.cmd(string.format('tabnew +%d %s', lnum, filename))
          vim.cmd(string.format('normal! %dG%d|', lnum, lcol))
        end
      end
    end
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<c-e>'] = actions.to_fuzzy_refine,
            ['<c-h>'] = 'which_key',
            ['<esc>'] = actions.close,
            ['<CR>'] = multiopen
          },
        },
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
          bottom_pane = {
            height = 25,
            preview_cutoff = 120,
            prompt_position = 'top',
          },
          center = {
            height = 0.4,
            preview_cutoff = 40,
            prompt_position = 'top',
            width = 0.5,
          },
          cursor = {
            height = 0.9,
            preview_cutoff = 40,
            width = 0.8,
          },
          horizontal = {
            height = 0.9,
            preview_cutoff = 0,
            prompt_position = 'bottom',
            width = 0.9,
          },
          vertical = {
            height = 0.9,
            preview_cutoff = 0,
            prompt_position = 'bottom',
            width = 0.9,
          },
        },
        file_ignore_patterns = {
          '**node_modules/',
          '**deps/',
          '**dist/',
          '**__snapshots__/',
          '**.git/',
          '**.next/',
          '**.yarn/',
          '**build/terraform/\\.terraform/',
          '**plugin/packer_compiled.lua',
          '**yarn.lock',
          '**yarn-error.log',
          '**install_module.log',
          'vendor',
          'sorbet',
          '_client_admin_old',
          '.bundle',
        },
        -- preview = {
        --   treesitter = false
        -- },
        prompt_prefix = 'λ -> ',
        selection_caret = '|> ',
      },
      pickers = {
        find_files = {
          hidden = true,
          -- theme = "dropdown",
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ['<C-k>'] = lga_actions.quote_prompt(),
              ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob *.rb --iglob !**/spec/**/*.rb' }),
            },
          },
        },
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        project = {
          base_dirs = {
            '~/repos',
          },
        },
      },
    })

    -- Extensions
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('project')
    require('telescope').load_extension('neoclip')
    require('telescope').load_extension('notify')
    -- require("telescope").load_extension("dap")
    require('telescope').load_extension('live_grep_args')
  end,
}
