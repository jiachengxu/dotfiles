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
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
}

M.ui = {
  statusline = {
    separator_style = "arrow"
  },
}

return M
