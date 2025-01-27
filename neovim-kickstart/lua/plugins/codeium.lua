return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "iguanacucumber/magazine.nvim",
  },
  config = function()
    require("codeium").setup({
      enable_chat = true,
      enable_local_search = true,
      enable_index_service = true,
    })
  end,
}
