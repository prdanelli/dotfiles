-- Vim motion suggestions
return {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  opts = {
    -- Add "oil" to the disabled_filetypes
    disabled_filetypes = require("config.excluded_filetypes"),
  },
}
