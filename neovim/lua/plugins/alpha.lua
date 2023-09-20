return {
  "goolord/alpha-nvim",
  lazy = false,
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    require("alpha").setup(require("alpha.themes.startify").config)

    -- Show the dashboard
    vim.keymap.set("n", "<leader>s", "<cmd>Alpha<cr>", { silent = true })
  end,
}
