local plugin_loaded, refactoring = pcall(require, "refactoring")
if not plugin_loaded then return end

require('refactoring').setup({})
