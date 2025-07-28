return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup({
      options = {
        mode = 'buffers',
        numbers = 'none',
        close_command = 'BWipeout %d',
        indicator = {
          icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = 'icon', --'icon' | 'underline' | 'none',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '● ',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        diagnostics = 'nvim_lsp', -- false | "nvim_lsp" | "coc"
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer', -- | function ,
            text_align = 'left',    -- "left" | "center" | "right"
            separator = true,
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- separator_style = { '\u{e0b6}', '\u{e0b4} ' },
        -- separator_style = { '', '' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        sort_by = 'insert_after_current', -- |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        -- add custom logic
        --     local modified_a = vim.fn.getftime(buffer_a.path)
        --     local modified_b = vim.fn.getftime(buffer_b.path)
        --     return modified_a > modified_b
        -- end,
      },
      -- highlights = {
      --   fill = {
      --     bg = '#1e2030',
      --   },
      --   background = {
      --     fg = '#828bb8',
      --     bg = '#1e2030', -- same as fill for seamless background
      --   },
      --   buffer_selected = {
      --     fg = '#1e2030', -- dark text on light background for contrast
      --     bg = '#82aaff',
      --     bold = true,
      --   },
      --   buffer_visible = {
      --     fg = '#a9b1d6',
      --     bg = '#2f334d', -- slightly raised from background
      --   },
      --   separator = {
      --     fg = '#1e2030', -- matches fill, creates invisible separation
      --     bg = '#1e2030',
      --   },
      --   separator_selected = {
      --     fg = '#1e2030', -- matches fill background
      --     bg = '#82aaff', -- matches selected buffer background
      --   },
      --   separator_visible = {
      --     fg = '#1e2030', -- matches fill
      --     bg = '#2f334d', -- matches visible buffer background
      --   },
      -- },
    })
  end,
}
