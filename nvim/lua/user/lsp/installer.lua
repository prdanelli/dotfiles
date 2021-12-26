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
				local jsonls_opts = require("user.lsp.settings.jsonls")
				opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
			end

			if server.name == "sumneko_lua" then
				local sumneko_opts = require("user.lsp.settings.sumneko_lua")
				opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
			end

			server:setup(opts)
		end)

		if not server:is_installed() then
			server:install()
		end
	end
end

