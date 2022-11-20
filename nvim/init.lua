local impatient_loaded, impatient = pcall(require, "impatient")
if impatient_loaded then
  impatient.enable_profile()
end

require "utils"

safe_load "config.options"
safe_load "config.keymaps"
safe_load "config.disable_builtins"
safe_load "lsp"
safe_load "plugins"
safe_load "autocommands"
safe_load "user.invert_term"
