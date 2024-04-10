return {
  "cbochs/grapple.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  event = { "BufReadPost", "BufNewFile" },
  cmd = "Grapple",
  config = function()
    require("grapple").setup({
      ---Grapple save location
      ---@type string
      save_path = vim.fn.stdpath("data") .. "/" .. "grapple",

      ---Default scope to use when managing Grapple tags
      ---For more information, please see the Scopes section
      ---@type string
      scope = "git_branch",

      ---User-defined scopes or overrides
      ---For more information about scopes, please see the Scope API section
      ---@type grapple.scope_definition[]
      scopes = {},

      ---Default scopes provided by Grapple
      ---For more information about default scopes, please see the Scopes section
      ---Disable by setting scope to "false". For example, { lsp = false }
      ---@type table<string, grapple.scope_definition | boolean>
      -- default_scopes = { ... }

      ---Show icons next to tags or scopes in Grapple windows
      ---Requires "nvim-tree/nvim-web-devicons"
      ---@type boolean
      icons = true,

      ---Highlight the current selection in Grapple windows
      ---Also, indicates when a tag path does not exist
      ---@type boolean
      status = true,

      ---Position a tag's name should be shown in Grapple windows
      ---@type "start" | "end"
      name_pos = "end",

      ---How a tag's path should be rendered in Grapple windows
      ---  "relative": show tag path relative to the scope's resolved path
      ---  "basename": show tag path basename and directory hint
      ---@type "basename" | "relative"
      style = "relative",

      ---A string of characters used for quick selecting in Grapple windows
      ---An empty string or false will disable quick select
      ---@type string | nil
      quick_select = "123456789",

      ---Default command to use when selecting a tag
      ---@type fun(path: string)
      command = vim.cmd.edit,

      ---User-defined tags title function for Grapple windows
      ---By default, uses the resolved scope's ID
      ---@type fun(scope: grapple.resolved_scope): string?
      tag_title = nil,

      ---User-defined scopes title function for Grapple windows
      ---By default, renders "Grapple Scopes"
      ---@type fun(): string?
      scope_title = nil,

      ---User-defined loaded scopes title function for Grapple windows
      ---By default, renders "Grapple Loaded Scopes"
      ---@type fun(): string?
      loaded_title = nil,

      ---Additional window options for Grapple windows
      ---See :h nvim_open_win
      ---@type grapple.vim.win_opts
      win_opts = {
        -- Can be fractional
        width = 80,
        height = 12,
        row = 0.5,
        col = 0.5,

        relative = "editor",
        border = "single",
        focusable = false,
        style = "minimal",
        title_pos = "center",

        -- Custom: fallback title for Grapple windows
        title = "Grapple",

        -- Custom: adds padding around window title
        title_padding = " ",
      },
    })
  end,
}
