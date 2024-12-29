return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    dashboard = {
      preset = {
        header = [[
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  ░░░░░██╗░██╗███████╗██╗░░░░░██╗░░░░░░█████╗░░░░░░
  ░░░░░██║░██║██╔════╝██║░░░░░██║░░░░░██╔══██╗░░░░░
  ░░░░░██████║█████╗░░██║░░░░░██║░░░░░██║░░██║░░░░░
  ░░░░░██╔═██║██╔══╝░░██║░░░░░██║░░░░░██║░░██║░░░░░
  ░░░░░██║░██║███████╗███████╗███████╗╚█████╔╝░░░░░
  ░░░░░╚═╝░╚═╝╚══════╝╚══════╝╚══════╝░╚════╝░░░░░░
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  ░░██╗░░░░░░░██╗░█████╗░██████╗░██╗░░░░░██████╗░░░
  ░░██║░░██╗░░██║██╔══██╗██╔══██╗██║░░░░░██╔══██╗░░
  ░░╚██╗████╗██╔╝██║░░██║██████╔╝██║░░░░░██║░░██║░░
  ░░░████╔═████║░██║░░██║██╔══██╗██║░░░░░██║░░██║░░
  ░░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║███████╗██████╔╝░░
  ░░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚══════╝╚═════╝░░░
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
]],
       -- stylua: ignore
       ---@type snacks.dashboard.Item[]
       keys = {
         { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
         { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
         { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
         { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
         { icon = "󰙅 ", key = "e", desc = "File Exporer", action = ":lua require('ranger-nvim').open(true)" },
         { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
         { icon = " ", key = "s", desc = "Restore Session", section = "session" },
         { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
         { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
         { icon = " ", key = "q", desc = "Quit", action = ":qa" },
       },
      },
    },
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
