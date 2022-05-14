vim.api.nvim_create_augroup("_color_theme", { clear = true })

-- Extending/overriding a colorscheme.
vim.api.nvim_create_autocmd("ColorScheme", {
  group = "_color_theme",
  pattern = "onedark",
  desc = "extend / override onedark",
  callback = function()
    local h = function(...) vim.api.nvim_set_hl(0, ...) end

    h("String", { fg = "#FFEB95" })
    h("TelescopeMatching", { link = "Boolean" })
  end
})


