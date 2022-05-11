local plugin_loaded, alpha = pcall(require, "alpha")
if not plugin_loaded then
	return
end

alpha.setup(require("alpha.themes.startify").opts)

-- Show the dashboard
vim.keymap.set("n", "<leader>s", "<cmd>Alpha<cr>", { silent = true })
