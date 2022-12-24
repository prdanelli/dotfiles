local impatient_loaded, impatient = pcall(require, "impatient")
if impatient_loaded then
  impatient.enable_profile()
end

require "utils"
require "plugins" -- Errors are generated with safe_load
require "lsp"

safe_load "config.options"
safe_load "config.keymaps"
safe_load "config.disable_builtins"
safe_load "autocommands"
safe_load "user.invert_term"
