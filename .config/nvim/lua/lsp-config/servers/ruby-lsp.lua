-- Ruby LSP specific configuration
local _timers = {}

-- Setup diagnostics for Ruby LSP
local function setup_diagnostics(client, buffer)
  -- Skip if built-in diagnostics are enabled
  if require('vim.lsp.diagnostic')._enable then
    return
  end

  -- Handler function for diagnostics
  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request('textDocument/diagnostic', { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format('Ruby LSP diagnostics error: %s', vim.inspect(err))
        vim.lsp.log.error(err_msg)
        return
      end

      -- Process diagnostic results
      local diagnostic_items = result and result.items or {}
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend('keep', params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  -- Initial diagnostics request
  diagnostic_handler()

  -- Set up buffer attachment for live diagnostics
  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      -- Clear existing timer if there is one
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      -- Debounce diagnostic requests (200ms)
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      -- Clean up timer when buffer is detached
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
        _timers[buffer] = nil
      end
    end,
  })
end

-- Command to show Ruby dependencies in quickfix list
local function add_ruby_deps_command(client, bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, 'ShowRubyDeps', function(opts)
    local params = vim.lsp.util.make_text_document_params()
    local showAll = opts.args == 'all'

    -- Request dependencies from Ruby LSP
    client.request('rubyLsp/workspace/dependencies', params, function(error, result)
      if error then
        vim.lsp.log.error('Error showing Ruby dependencies: ' .. vim.inspect(error))
        return
      end

      if not result or vim.tbl_isempty(result) then
        vim.lsp.log.info('No Ruby dependencies found')
        return
      end

      -- Build quickfix list
      local qf_list = {}
      for _, item in ipairs(result) do
        if showAll or item.dependency then
          table.insert(qf_list, {
            text = string.format('%s (%s) - %s', item.name, item.version, item.dependency),
            filename = item.path or '',
          })
        end
      end

      -- Set and open quickfix list
      vim.fn.setqflist(qf_list)
      vim.cmd('copen')
    end, bufnr)
  end, {
    nargs = '?',
    desc = 'Show Ruby dependencies in quickfix list (use "all" to show indirect dependencies)',
    complete = function()
      return { 'all' }
    end,
  })
end

return function(lspconfig, default_config)
  lspconfig.ruby_lsp.setup({
    cmd = { 'mise x -- ruby-lsp' },
    capabilities = default_config.capabilities,
    on_attach = function(client, buffer)
      -- Call the default on_attach first
      if default_config.on_attach then
        default_config.on_attach(client, buffer)
      end

      -- Ruby-specific setup
      setup_diagnostics(client, buffer)
      add_ruby_deps_command(client, buffer)
    end,
    settings = {
      rubyLsp = {
        formatter = 'auto', -- 'auto', 'rubocop', or 'none'
        rubocopPath = 'bundle exec rubocop',
        experimentalFeaturesEnabled = true,
      },
    },
    filetypes = { 'ruby' },
    root_dir = lspconfig.util.root_pattern('Gemfile', '.git', '.ruby-version'),
  })
end
