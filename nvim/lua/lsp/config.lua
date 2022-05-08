local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local utils = require("utils")
local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "html",
  "jsonls",
  "lemminx",
  "solargraph",
  "sqlls",
  "sumneko_lua",
  "tsserver",
  "yamlls",
}

for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer.get_server(server_name)

  if server_available then
    server:on_ready(function()
      local opts = {
        on_attach = require("lsp.handlers").on_attach(),
        capabilities = require("lsp.handlers").capabilities,
      }

      local language_settings_exist, settings = pcall(require, "lsp.settings." .. server.name)
      if language_settings_exist then
        opts = vim.tbl_deep_extend("force", settings, opts)
      end

      server:setup(opts)
    end)

    if not server:is_installed() then
      utils.info("Installing " .. server_name)
      server:install()
    end
  else
    utils.error(server)
  end
end

