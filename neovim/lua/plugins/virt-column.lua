-- Add better vertical lines
return {
  "lukas-reineke/virt-column.nvim",
  event = "BufReadPre",
  config = function()
    require("virt-column").setup({
      enabled = true,
      char = "┃",
      virtcolumn = "",
      highlight = "NonText",
      exclude = {
        filetypes = {
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "TelescopePrompt",
          "TelescopeResults",
        },
        buftypes = { "nofile", "quickfix", "terminal", "prompt" },
      },
    })
  end,
}
