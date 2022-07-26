local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then return end

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    show_buffer_icons = false,
    show_tab_indicators = false,
    show_buffer_close_icons = false,
    show_close_icon = true,
    persist_buffer_sort = false,
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 21,
    separator_style = "none",
    indicator_icon = "│",
    offsets = { { filetype = "NvimTree", text = "" } },
    sort_by = "id",
  },
})

