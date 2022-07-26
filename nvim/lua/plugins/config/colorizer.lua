local plugin_loaded, colorizer = pcall(require, "colorizer")
if not plugin_loaded then return end

colorizer.setup()
