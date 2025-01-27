-- Replace with register and don"t copy
return {
  "vim-scripts/ReplaceWithRegister",
  event = "BufEnter",
  config = function()
    vim.keymap.set({ "n", "x" }, "gr", "<nop>")
    vim.keymap.set("n", "grr", "<nop>")

    local opts = { noremap = false, silent = true }

    vim.keymap.set("n", "s", "<Plug>ReplaceWithRegisterOperator", opts)
    vim.keymap.set("x", "s", "<Plug>ReplaceWithRegisterVisual", opts)
  end,
}
