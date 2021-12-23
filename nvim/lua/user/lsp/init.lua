local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

-- Install any required Language Servers
require("user.lsp.installer")

-- Setup the installed Language Servers
require("user.lsp.handlers").setup()
