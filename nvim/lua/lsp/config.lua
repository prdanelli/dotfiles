local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "dockerls",
    "jsonls",
    "lemminx",
    "solargraph",
    "sumneko_lua",
    "tsserver",
    "yamlls",
  }
}

local defaults = {
  on_attach = require("lsp.handlers").on_attach,
  capabilities = require("lsp.handlers").capabilities,
}

local lspconfig = require("lspconfig")

local luadev_ok, luadev = pcall(require, "neodev")
if luadev_ok then
  lspconfig.sumneko_lua.setup(luadev.setup(vim.tbl_deep_extend("force", require("lsp.settings.sumneko_lua"), defaults)))
else
  lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", require("lsp.settings.sumneko_lua"), defaults))
end

lspconfig.solargraph.setup(vim.tbl_deep_extend("force", require("lsp.settings.solargraph"), defaults))
lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("lsp.settings.jsonls"), defaults))
lspconfig.bashls.setup(defaults)
lspconfig.cssls.setup(defaults)
lspconfig.dockerls.setup(defaults)
lspconfig.html.setup(defaults)
lspconfig.lemminx.setup(defaults)
lspconfig.sqlls.setup(defaults)
lspconfig.tsserver.setup(defaults)
lspconfig.yamlls.setup(defaults)
