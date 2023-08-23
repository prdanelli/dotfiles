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

local status_ok, plugin = pcall(require, "lazy")
if not status_ok then
  return
end

local opts = {
  spec = "plugins",
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
  },
  lockfile = vim.fn.stdpath("config") .. "/.lazy-lock.json",
  concurrency = 50,
  install = {
    missing = true, -- install missing plugins on startup.
    colorscheme = { "onenord" }, -- try to load one of these colorschemes when installation
  },
  checker = { enabled = true },
  ui = {
    size = {
      width = 0.7,
      height = 0.7,
    },
  },
  performance = {
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true,
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
}

plugin.setup(opts)
