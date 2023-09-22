return {
  'eliseshaffer/darklight.nvim',
  cmd = 'DarkLightSwitch',
  config = function()
    require('darklight').setup()
  end,
}
