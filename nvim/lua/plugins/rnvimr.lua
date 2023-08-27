return {
  "kevinhwang91/rnvimr",
  config = function()
    local options = {
      rnvimr_enable_ex = 1, -- Make Ranger replace netrw and be the file explorer
      rnvimr_enable_picker = 1, -- Make Ranger to be hidden after picking a file
      rnvimr_draw_border = 0, -- Border for floating window
      rnvimr_hide_gitignore = 1, -- Hide the files included in gitignore
      rnvimr_enable_bw = 1, -- Make Neovim wipe the buffers corresponding to the files deleted by Ranger
      rnvimr_shadow_winblend = 50, -- Add a shadow window, value is equal to 100 will disable shadow
      rnvimr_ranger_cmd = { "ranger" }, -- Draw border with both
    }

    for k, v in pairs(options) do
      vim.g[k] = v
    end

    -- Link CursorLine into RnvimrNormal highlight in the Floating window
    vim.cmd([[highlight link RnvimrNormal CursorLine]])

    vim.cmd([[
      let g:rnvimr_layout = {
        \ 'relative': 'editor',
        \ 'width': float2nr(round(0.95 * &columns)),
        \ 'height': float2nr(round(0.95 * &lines)),
        \ 'col': float2nr(round(0.025 * &columns)),
        \ 'row': float2nr(round(0.025 * &lines)),
        \ 'style': 'minimal'
        \ }
     ]])
  end,
  event = "BufEnter",
}
