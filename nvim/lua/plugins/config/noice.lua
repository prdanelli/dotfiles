local status_ok, noice = pcall(require, "noice")
if not status_ok then return end

noice.setup({
  cmdline = {
    view = "cmdline_popup",
    opts = { buf_options = { filetype = "vim" } },
    icons = {
      [":"] = { icon = " ", hl_group = "DiagnosticHint", firstc = false },
      ["/"] = { icon = " >>", hl_group = "DiagnosticWarn" },
      ["?"] = { icon = " <<", hl_group = "DiagnosticError" },
    },
  },
  history = {
    view = "split",
    opts = { enter = true },
    filter = {
      event = "msg_show",
      ["not"] = {
        kind = { "search_count", "echo" }
      }
    },
  },
  messages = {
    enabled = false,
  },
  notify = {
    enabled = false,
  },
  popupmenu = {
    enabled = true,
    backend = "nui",
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = { skip = true },
    },
  },
  throttle = 1000 / 30,
  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 1, 2 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
  },
  win_options = {
    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
  },
})
