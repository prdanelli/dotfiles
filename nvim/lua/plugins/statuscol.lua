local plugin_loaded, statuscol = pcall(require, "statuscol")
if not plugin_loaded then return end

local builtin = require("statuscol.builtin")

statuscol.setup({
  relculright = true,
  segments = {
    { text = { "%s" } },
    { text = { builtin.lnumfunc, "  " } },
  }
})
