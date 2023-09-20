vim.opt.termguicolors = true

local modules = {
  "user.utils",
  "config.options",
  "config.keymaps",
  "autocommands",
  "config.plugins",
  "config.disable_builtins",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end