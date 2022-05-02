-- https://alpha2phi.medium.com/neovim-for-beginners-lsp-using-null-ls-nvim-bd954bf86b40

local M = {}

local nls = require("null-ls")
local nls_utils = require("null-ls.utils")
local b = nls.builtins

local sources = {
  -- Formatting
  b.formatting.prettierd,
  b.formatting.shfmt,
  b.formatting.fixjson,
  b.formatting.trim_newlines,
  b.formatting.rubocop,
  b.formatting.stylua,

  -- Diagnostics
  -- b.diagnostics.write_good,
  -- b.diagnostics.markdownlint,
  -- b.diagnostics.eslint_d,
  -- b.diagnostics.flake8,
  -- b.diagnostics.tsc,

  -- Code actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,

  -- Hover
  b.hover.dictionary,
}

function M.setup(opts)
  nls.setup({
    -- debug = true,
    debounce = 150,
    save_after_format = false,
    sources = sources,
    on_attach = opts.on_attach,
    root_dir = nls_utils.root_pattern(".git"),
  })
end

return M
