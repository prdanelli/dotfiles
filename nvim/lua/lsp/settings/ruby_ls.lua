return {
  settings = {
    ruby_ls = {
      default_config = {
        cmd = { "bundle", "exec", "ruby-lsp" },
        filetypes = { "ruby" },
        root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git"),
        -- init_options = {
        --   enabledFeatures = {
        --     -- "documentHighlights",
        --     -- "documentSymbols",
        --     -- "foldingRanges",
        --     -- "selectionRanges",
        --     -- -- "semanticHighlighting",
        --     -- "formatting",
        --     -- "codeActions",
        --   },
        -- },
        -- settings = {},
      },
      -- commands = {
      --   FormatRuby = {
      --     function()
      --       vim.lsp.buf.format({
      --         name = "ruby_lsp",
      --         async = true,
      --       })
      --     end,
      --     description = "Format using ruby-lsp",
      --   },
      -- },
    }
  }
}