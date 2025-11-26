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
            text_align = 'left', -- "left" | "center" | "right"
            separator = true,
          },
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        -- separator_style = { '\u{e0b6}', '\u{e0b4} ' },
        -- separator_style = { '', '' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        separator_style = 'thin', -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        sort_by = 'insert_after_current', -- |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        -- add custom logic
        --     local modified_a = vim.fn.getftime(buffer_a.path)
        --     local modified_b = vim.fn.getftime(buffer_b.path)
        --     return modified_a > modified_b
        -- end,
        max_name_length = 18,
        tab_size = 16,
      },
      highlights = {
        fill = {
          bg = '#222436',
        },
        background = {
          -- fg = '#828bb8',
          bg = '#545c7e', -- same as fill for seamless background
        },
        buffer_selected = {
          fg = '#1e2030', -- dark text on light background for contrast
          bg = '#82aaff',
          bold = true,
        },
        buffer_visible = {
          fg = '#545c7e',
          bg = '#2f334d',
        },
        separator = {
          fg = '#545c7e',
          bg = '#2f334d',
        },
        separator_selected = {
          fg = '#1e2030',
          bg = '#82aaff',
        },
        separator_visible = {
          fg = '#545c7e',
          bg = '#2f334d',
        },
        modified = {
          fg = '#ff9e64',
          bg = '#545c7e',
        },
        modified_selected = {
          fg = '#ff9e64',
          bg = '#82aaff',
        },
        modified_visible = {
          fg = '#ff9e64',
          bg = '#545c7e',
        },
        error_diagnostic = {
          fg = '#ff6c6b',
          bg = '#545c7e',
        },
        error_diagnostic_selected = {
          fg = '#ff6c6b',
          bg = '#82aaff',
        },
        error_diagnostic_visible = {
          fg = '#ff6c6b',
          bg = '#545c7e',
        },
        error = {
          fg = '#ff6c6b',
          bg = '#545c7e',
        },
        error_visible = {
          fg = '#ff6c6b',
          bg = '#545c7e',
        },
        error_selected = {
          fg = '#ff6c6b',
          bg = '#82aaff',
        },
        warning_diagnostic = {
          fg = '#e0af68',
          bg = '#545c7e',
        },
        warning_diagnostic_selected = {
          fg = '#e0af68',
          bg = '#82aaff',
        },
        warning_diagnostic_visible = {
          fg = '#e0af68',
          bg = '#545c7e',
        },
        warning = {
          fg = '#e0af68',
          bg = '#545c7e',
        },
        warning_visible = {
          fg = '#e0af68',
          bg = '#545c7e',
        },
        warning_selected = {
          fg = '#e0af68',
          bg = '#82aaff',
        },
        info_diagnostic = {
          fg = '#0db9d7',
          bg = '#545c7e',
        },
        info_diagnostic_selected = {
          fg = '#0db9d7',
          bg = '#82aaff',
        },
        info_diagnostic_visible = {
          fg = '#0db9d7',
          bg = '#545c7e',
        },
        info = {
          fg = '#0db9d7',
          bg = '#545c7e',
        },
        info_visible = {
          fg = '#0db9d7',
          bg = '#545c7e',
        },
        info_selected = {
          fg = '#0db9d7',
          bg = '#82aaff',
        },
        hint_diagnostic = {
          fg = '#10B981',
          bg = '#545c7e',
        },
        hint_diagnostic_selected = {
          fg = '#10B981',
          bg = '#82aaff',
        },
        hint_diagnostic_visible = {
          fg = '#10B981',
          bg = '#545c7e',
        },
        hint = {
          fg = '#10B981',
          bg = '#545c7e',
        },
        hint_visible = {
          fg = '#10B981',
          bg = '#545c7e',
        },
        hint_selected = {
          fg = '#10B981',
          bg = '#82aaff',
        },
        duplicate = {
          fg = '#828bb8',
          bg = '#545c7e',
          italic = true,
        },
        duplicate_visible = {
          fg = '#828bb8',
          bg = '#2f334d',
          italic = true,
        },
        duplicate_selected = {
          fg = '#1e2030',
          bg = '#82aaff',
          italic = true,
        },
      },
    })
  end,
}
