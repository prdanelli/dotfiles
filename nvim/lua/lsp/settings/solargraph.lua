return {
  settings = {
    Solargraph = {
      root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
    },
  },
}
