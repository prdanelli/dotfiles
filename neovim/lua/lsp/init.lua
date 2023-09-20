local M = {}

M.setup = function()
  require("lsp.config").setup()
  require("lsp.handlers").setup()
end

return M
