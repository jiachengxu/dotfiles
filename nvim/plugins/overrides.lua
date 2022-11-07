local M = {}

M.nvimtree = {
  git = {
    enable = true,
  },
  view = {
    mappings = {
      list = {
        { key = "s", action = "vsplit" },
      },
    },
  },
  renderer = {
    highlight_git = true,
  },
}

M.ui = {
  statusline = {
    separator_style = "arrow"
  },
}

return M
