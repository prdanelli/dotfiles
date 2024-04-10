return {
  "simrat39/symbols-outline.nvim",
  keys = { { "<leader>co", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
  cmd = "SymbolsOutline",
  opts = function()
    local Config = require("lazyvim.config")
    local defaults = require("symbols-outline.config").defaults
    local opts = {
      symbols = {},
      symbol_blacklist = {},
    }
    local filter = Config.kind_filter

    if type(filter) == "table" then
      filter = filter.default
      if type(filter) == "table" then
        for kind, symbol in pairs(defaults.symbols) do
          opts.symbols[kind] = {
            icon = Config.icons.kinds[kind] or symbol.icon,
            hl = symbol.hl,
          }
          if not vim.tbl_contains(filter, kind) then
            table.insert(opts.symbol_blacklist, kind)
          end
        end
      end
    end
    return opts
  end,
}
