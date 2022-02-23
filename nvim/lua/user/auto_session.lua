local status_ok, bufferline = pcall(require, "auto-session")
if not status_ok then
  return
end

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
