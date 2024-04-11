return {
  "ruifm/gitlinker.nvim",
  event = "VeryLazy",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("gitlinker").setup()

    vim.keymap.del({ "n", "v" }, "<leader>gy")

    vim.keymap.set(
      { "n", "v" },
      "<leader>gl",
      "<cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<cr>",
      { desc = "Git Link", silent = true }
    )
  end,
}
