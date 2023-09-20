local util = require("lspconfig.util")

return {
  settings = {
    Solargraph = {
      root_dir = util.root_pattern("Gemfile", ".git")(fname) or util.path.dirname(vim.api.nvim_buf_get_name(0)),
    },
  },
}
