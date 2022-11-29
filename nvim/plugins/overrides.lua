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
    separator_style = "arrow",
    overriden_modules = function()
      return require "custom.plugins.statusline"
    end,
  },
  tabufline = {
    enabled = false,
  },
}

M.gitsigns = {
  signs = {
    add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
    change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
  },
  numhl = true,
}

M.treesitter = {
  ensure_installed = {
    "bash",
    "dockerfile",
    "git_rebase",
    "gitignore",
    "go",
    "gomod",
    "gowork",
    "javascript",
    "json",
    "jsonnet",
    "lua",
    "make",
    "markdown",
    "sql",
    "yaml",
  },
}

M.telescope = {
  defaults = {
    path_display = { "absolute" },
    prompt_prefix = " > ",
    show_line = false,
    mappings = {
      i = {
        ["<C-s>"] = "select_vertical"
      }
    }
  },
  pickers = {
    lsp_references = {
      show_line = false,
      results_title = false,
      preview_title = false,
      prompt_title = false,
    },
    live_grep = {
      show_line = false,
      results_title = false,
      preview_title = false,
      prompt_title = false,
    },
    find_files = {
      show_line = false,
      results_title = false,
      preview_title = false,
      prompt_title = false,
    },
    lsp_implementations = {
      show_line = false,
      results_title = false,
      preview_title = false,
      prompt_title = false,
    },
    buffers = {
      show_line = false,
      results_title = false,
      preview_title = false,
      prompt_title = false,
    },
  },
}

return M
