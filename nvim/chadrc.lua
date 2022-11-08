local M = {}

M.ui = {
  theme_toggle = { "gruvbox_material", "oceanic-next" },
  theme = "gruvbox_material",
}

M.plugins = require "custom.plugins"
-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
