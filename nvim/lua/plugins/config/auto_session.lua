local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then return end

vim.o.sessionoptions="buffers,curdir,folds,tabpages,winsize,winpos"

auto_session.setup({
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
})
