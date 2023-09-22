return {
  'kevinhwang91/nvim-hlslens',
  event = 'VeryLazy',
  config = function()
    local icons = require('utils.icons').general
    require('hlslens').setup({
      calm_down = true,
      override_lens = function(render, plist, nearest, idx, r_idx)
        local sfw = vim.v.searchforward == 1
        local indicator, text, chunks
        local abs_r_idx = math.abs(r_idx)
        if abs_r_idx > 1 then
          indicator = string.format(
            '%d%s',
            abs_r_idx,
            sfw ~= (r_idx > 1) and '' .. icons.ArrowUpFilled .. '' or '' .. icons.ArrowDownFilled .. ''
          )
        elseif abs_r_idx == 1 then
          indicator = sfw ~= (r_idx == 1) and '' .. icons.ArrowUpFilled .. '' or '' .. icons.ArrowDownFilled .. ''
        else
          indicator = ''
        end

        local lnum, col = unpack(plist[idx])
        if nearest then
          local cnt = #plist
          if indicator ~= '' then
            text = string.format('[%s %d/%d]', indicator, idx, cnt)
          else
            text = string.format('[%d/%d]', idx, cnt)
          end
          chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLensNear' } }
        else
          text = string.format('[%s %d]', indicator, idx)
          chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
        end
        render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
      end,
    })
  end,
}
