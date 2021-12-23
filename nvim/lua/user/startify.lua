vim.g["startify_custom_header"] = "[]"
vim.g["startify_change_to_dir"] = 0
vim.g["startify_enable_special"] = 0

vim.g.startify_lists = {
  { type = "sessions", header = {" Sessions"} }, 
  { type = "files", header = {" Files"} }, 
  { type = "dir", header = {" Files " .. vim.fn.getcwd()} }, 
  { type = "bookmarks", header = {" Bookmarks"} }, 
  { type = "commands", header = {" Commands"} }
}

vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>Startify<cr>", { noremap = true, silent = true })
