return {
  "saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.default",
  },
  opts = {
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups when your theme doesn't support blink.cmp
      -- use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono", -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font' adjusts spacing to ensure icons are aligned
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
          columns = { { "label", "label_description", gap = 1 }, { gap = 2, "kind_icon", "kind" } },
        },
        border = "rounded",
      },
      list = {
        selection = { preselect = true, auto_insert = true },
      },
      ghost_text = {
        enabled = false,
      },
    },
    signature = {
      window = {
        border = "rounded",
      },
    },
    sources = {
      default = { "lsp", "buffer", "path", "snippets" },
    },
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },

      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },

      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
  },
  config = function(_, opts)
    require("blink.cmp").setup(opts)
  end,
}
