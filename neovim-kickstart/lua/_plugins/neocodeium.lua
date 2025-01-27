return {
  "monkoose/neocodeium",
  enabled = false,
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    local cmp = require("cmp")

    -- cmp.event:on("menu_opened", function()
    --   neocodeium.clear()
    -- end)

    -- neocodeium.setup({
    --   filter = function()
    --     return not cmp.visible()
    --   end,
    -- })
    --
    -- cmp.setup({
    --   completion = {
    --     autocomplete = true,
    --   },
    -- })
    --
    -- neocodeium.setup({
    --   manual = true, -- recommended to not conflict with nvim-cmp
    -- })
    --
    -- create an autocommand which closes cmp when ai completions are displayed
    vim.api.nvim_create_autocmd("User", {
      pattern = "NeoCodeiumCompletionDisplayed",
      callback = function()
        require("cmp").abort()
      end,
    })

    vim.keymap.set("i", "<A-f>", function()
      neocodeium.accept()
    end)
    vim.keymap.set("i", "<A-w>", function()
      neocodeium.accept_word()
    end)
    vim.keymap.set("i", "<A-a>", function()
      neocodeium.accept_line()
    end)
    vim.keymap.set("i", "<A-e>", function()
      neocodeium.cycle_or_complete()
    end)
    vim.keymap.set("i", "<A-r>", function()
      neocodeium.cycle_or_complete(-1)
    end)
    vim.keymap.set("i", "<A-c>", function()
      neocodeium.clear()
    end)
  end,
}
