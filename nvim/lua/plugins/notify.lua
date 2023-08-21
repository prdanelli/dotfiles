local loaded, notify = pcall(require, "notify")
if not loaded then
  return
end

notify.setup({
  render = "minimal",
  stages = "fade",
  timeout = 3000,
  fps = 30,
})

vim.notify = notify
