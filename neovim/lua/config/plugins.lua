local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = "plugins",
  defaults = { lazy = false },
  lockfile = vim.fn.stdpath("config") .. "/.lazy-lock.json",
  concurrency = 50,
  install = {
    missing = true, -- install missing plugins on startup.
    colorscheme = { "onenord" }, -- try to load one of these colorschemes when installation
  },
  checker = { enabled = false },
  ui = {
    size = {
      width = 0.7,
      height = 0.7,
    },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})