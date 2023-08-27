return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")

    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { "%s" } },
        { text = { builtin.lnumfunc, "  " } },
      },
    })
  end,
}
