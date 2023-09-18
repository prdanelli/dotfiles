-- Add better vertical lines
return {
  "lukas-reineke/virt-column.nvim",
  config = function()
    require("virt-column").setup()
  end,
  event = "BufReadPre",
}
