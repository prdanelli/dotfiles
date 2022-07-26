local status_ok, _ = pcall(require, "auto-session")
if not status_ok then return end

vim.o.sessionoptions="buffers,curdir,folds,tabpages,winsize,winpos"
