local status_ok, noice = pcall(require, "noice")
if not status_ok then return end

noice.setup({
  notify = {
    enabled = false,
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    -- bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {
      buf_options = { filetype = "vim" }
    },
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
    }
  },
  routes = {
    -- skip search_count messages instead of showing them as virtual text
    {
      filter = { event = "msg_show", kind = "search_count" },
      opts = { skip = true },
    },
    -- always route any messages with more than 20 lines to the split view
    {
      view = "split",
      filter = { event = "msg_show", min_height = 20 },
    },
  },
  views = {
    split = {
      enter = true
    },
    cmdline_popup = {
      backend = "popup",
      relative = "editor",
      focusable = false,
      enter = false,
      zindex = 60,
      position = {
        row = "50%",
        col = "50%",
      },
      size = {
        min_width = 80,
        width = "auto",
        height = "auto",
      },
      border = {
        style = "rounded",
        padding = { 1, 2 },
      },
      win_options = {
        winhighlight = {
          Normal = "NoiceCmdlinePopup",
          FloatBorder = "NoiceCmdlinePopupBorder",
          IncSearch = "",
          Search = "",
        },
        cursorline = false,
      },
    },
  }
})
