return {
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  cmd = 'DBee',
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup({
      -- [{"id": "file_source_/Users/blaineventurine/.local/state/nvim/dbee/persistence.jsonsnDnMZ8EaN", "url": "root@tcp(localhost:3306)/algoliaweb_dev", "name": "algoliaweb_dev", "type": "mysql"}]
     -- is what the connection string looks like in the persistence file
      connections = {
        {
          name = 'algoliaweb_dev',
          type = 'mysql',
          url = 'root@tcp(localhost:3306)/algoliaweb_dev',
        },
      },
    })
  end,
}
