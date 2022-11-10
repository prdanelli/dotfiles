local status_ok, incline = pcall(require, "incline")
if not status_ok then return end

-- Code taken from: https://github.com/b0o/incline.nvim/discussions/31

local function get_diagnostic_label(props)
  local icons = require("config.icons").icons

  local label = {}
  for severity, icon in pairs(icons) do
    local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    if n > 0 then
      table.insert(label, { icon .. ' ' .. n .. ' ', group = 'DiagnosticSign' .. severity })
    end
  end
  return label
end

incline.setup({
  debounce_threshold = { falling = 500, rising = 250 },
  render = function(props)
    local bufname = vim.api.nvim_buf_get_name(props.buf)
    local filename = vim.fn.fnamemodify(bufname, ":t")
    local diagnostics = get_diagnostic_label(props)
    local filetype_icon, color = require("nvim-web-devicons").get_icon_color(filename)

    local buffer = {
      { " " },
      { filetype_icon, guifg = color },
      { " " },
    }

    if #diagnostics > 0 then
      table.insert(diagnostics, { "| ", guifg = "grey" })
    end
    for _, buffer_ in ipairs(buffer) do
      table.insert(diagnostics, buffer_)
    end
    return diagnostics
  end,
  window = {
    winhighlight = {
      active = {
        Normal = "MiniTablineCurrent"
      },
      inactive = {
        Normal = "MiniTablineVisible"
      },
    }
  }
})
