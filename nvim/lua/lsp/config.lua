local mason_loaded, mason = pcall(require, "mason")
if not mason_loaded then
  return
end

local mlsp_loaded, mlsp = pcall(require, "mason-lspconfig")
if not mlsp_loaded then
  return
end
--
-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
local luadev_ok, luadev = pcall(require, "neodev")
if luadev_ok then
  luadev.setup()
end

local lspconfig = require('lspconfig')

mason.setup()
mlsp.setup()

local defaults = {
  on_attach = require("lsp.handlers").on_attach,
  capabilities = require("lsp.handlers").capabilities,
}

lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", require("lsp.settings.lua_ls"), defaults))
lspconfig.solargraph.setup(vim.tbl_deep_extend("force", require("lsp.settings.solargraph"), defaults))

-- lspconfig.ruby_ls.setup(vim.tbl_deep_extend("force", require("lsp.settings.ruby_ls"), defaults))

lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("lsp.settings.jsonls"), defaults))
lspconfig.bashls.setup(defaults)
lspconfig.dockerls.setup(defaults)
lspconfig.html.setup(defaults)
lspconfig.lemminx.setup(defaults)
lspconfig.sqlls.setup(defaults)
lspconfig.tsserver.setup(defaults)
lspconfig.yamlls.setup(defaults)