return {
	settings = {
		Solargraph = {
			root_dir = function(fname)
				return require("lspconfig").util.root_pattern("Gemfile", ".git")(fname) or vim.fn.getcwd()
			end
		},
	},
}

