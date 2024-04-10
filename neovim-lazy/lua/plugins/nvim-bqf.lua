-- Better quick list
return {
  "kevinhwang91/nvim-bqf",
  ft = "qf",
  config = function()
    require("bqf").setup({
      auto_enable = true,
      auto_resize_height = true, -- highly recommended enable
      preview = {
        auto_preview = true,

        border = "single",
        show_title = false,
        show_scroll_bar = false,
        delay_syntax = 30,
        winblend = 0,
        win_height = 15,
        win_vheight = 15,
        wrap = false,
        buf_label = true,
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },

        should_preview_cb = function(bufnr)
          local ret = true
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          local fsize = vim.fn.getfsize(bufname)

          if fsize > 100 * 1024 then
            -- skip file size greater than 100k
            ret = false
          elseif bufname:match("^fugitive://") then
            -- skip fugitive buffer
            ret = false
          end

          return ret
        end,
      },
      -- make `drop` and `tab drop` to become preferred
      func_map = {
        drop = "o",
        openc = "O",
        split = "<C-s>",
        tabdrop = "<C-t>",
        -- set to empty string to disable
        tabc = "",
        ptogglemode = "z,",
      },
      filter = {
        fzf = {
          action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
          extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
        },
      },
    })
  end,
}
