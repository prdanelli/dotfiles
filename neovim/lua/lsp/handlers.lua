M = {}

M.import_depdendencies = function()
  local loaded, mason = pcall(require, "mason")
  if not loaded then
    return
  end

  local loaded, mlsp = pcall(require, "mason-lspconfig")
  if not loaded then
    return
  end

  -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
  local loaded, luadev = pcall(require, "neodev")
  if loaded then
    luadev.setup()
  end

  mason.setup()
  mlsp.setup()
end

M.setup_language_servers = function(defaults)
  local lspconfig = require("lspconfig")

  lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", require("lsp.settings.lua_ls"), defaults))
  lspconfig.solargraph.setup(vim.tbl_deep_extend("force", require("lsp.settings.solargraph"), defaults))
  lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("lsp.settings.jsonls"), defaults))
  lspconfig.bashls.setup(defaults)
  lspconfig.dockerls.setup(defaults)
  lspconfig.html.setup(defaults)
  lspconfig.lemminx.setup(defaults)
  lspconfig.sqlls.setup(defaults)
  lspconfig.tsserver.setup(defaults)
  lspconfig.yamlls.setup(defaults)
end

M.default_on_attach = function(client, bufnr)
  require("lsp.keymaps").setup(client, bufnr)
  -- require("lsp.auto_commands").setup(client, bufnr)
end

M.set_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local loaded, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if not loaded then
    return capabilities
  end

  return cmp_nvim_lsp.default_capabilities(capabilities)
end

M.setup = function()
  M.import_depdendencies()

  local defaults = {
    on_attach = M.default_on_attach,
    capabilities = M.set_capabilities(),
  }

  M.setup_language_servers(defaults)
end

return M
