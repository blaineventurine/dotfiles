return {
  'kevinhwang91/nvim-ufo',
  event = 'VeryLazy',
  -- commit = 'a6132d0',
  dependencies = {
    'kevinhwang91/promise-async',
    'kevinhwang91/nvim-hlslens',
  },
  config = function()
    local icons = require('utils.icons').general
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('' .. icons.ArrowDiagonalSouthwest .. ' %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end
    -- Remap for hlslens to deal with folds
    local function nN(char)
      local hlslens = require('hlslens')
      local ok, winid = hlslens.nNPeekWithUFO(char)
      if ok and winid then
        -- Safe to override buffer scope keymaps remapped by ufo,
        -- ufo will restore previous buffer keymaps before closing preview window
        -- Type <CR> will switch to preview window and fire `trace` action
        vim.keymap.set('n', '<CR>', function()
          local keyCodes = vim.api.nvim_replace_termcodes('<Tab><CR>', true, false, true)
          vim.api.nvim_feedkeys(keyCodes, 'im', false)
        end, { buffer = true })
      end
    end

    vim.keymap.set({ 'n', 'x' }, 'n', function()
      nN('n')
    end)
    vim.keymap.set({ 'n', 'x' }, 'N', function()
      nN('N')
    end)
    -- global handler
    -- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
    -- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
    require('ufo').setup({
      fold_virt_text_handler = handler,
      provider_selector = function(bufnr, filetype, buftype)
        return { 'treesitter', 'indent' }
      end,
    })
  end,
}
