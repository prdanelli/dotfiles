local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "solargraph",
  "bashls",
  "cssls",
  "dockerls",
  "html",
  "jsonls",
  "sumneko_lua",
  "sqlls",
  "tsserver",
  "lemminx",
  "yamlls",
}

for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer.get_server(server_name)

  if server_available then
    server:on_ready(function()
      local opts = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
      }

      if server.name == "jsonls" then
        opts = vim.tbl_deep_extend("force", require("user.lsp.settings.jsonls"), opts)
      end

      if server.name == "sumneko_lua" then
        opts = vim.tbl_deep_extend("force", require("user.lsp.settings.sumneko_lua"), opts)
      end

      if server.name == "solargraph" then
        opts = vim.tbl_deep_extend("force", require("user.lsp.settings.solargraph"), opts)
      end

      server:setup(opts)
    end)

    if not server:is_installed() then
      server:install()
    end
  end
end

