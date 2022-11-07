local M = {}

M.ui = {
  theme_toggle = { "nord", "oceanic-next" },
  theme = "oceanic-next",
}

M.plugins = require "custom.plugins"
-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
