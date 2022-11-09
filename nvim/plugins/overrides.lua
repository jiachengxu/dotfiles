local M = {}

M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
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

M.gitsigns = {
  signs = {
    add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
  },
  numhl      = true,
}

return M
