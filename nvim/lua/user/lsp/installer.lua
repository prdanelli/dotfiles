local status_ok, lsp_installer = pcall(require "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "solargraph",
  "bash",
  "cssls",
  "dockerls",
  "html",
  "jsonls",
  "lua",
  "tsserver",
  "lemminx",
  "yamlls",
}

for _, name in pairs(servers) do
  local ok, server = lsp_installer.get_server(name)
  if ok then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  server:setup(opts)
end)

