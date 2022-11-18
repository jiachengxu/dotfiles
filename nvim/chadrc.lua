local M = {}

M.ui = {
  theme_toggle = { "gruvbox_material", "everforest" },
  theme = "everforest",
  changed_themes = {
    gruvbox_material = {
      base_16 = {
        base02 = "#6c6c6c",
      },
    },
    everforest = {
      base_16 = {
        base02 = "#6c6c6c",
      },
    },
  },
  transparency = true
}

M.plugins = require "custom.plugins"
-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
