return {
  "jinh0/eyeliner.nvim",
  config = function()
    local colors = require("config.colors").colors

    require("eyeliner").setup({
      highlight_on_key = true,
    })

    vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = colors.yellow, bold = true, underline = false })
    vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = colors.orange, underline = false })
  end,
}
