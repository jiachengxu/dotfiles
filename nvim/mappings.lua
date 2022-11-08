local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
  },
}

M.nvterm = {
  t = {
    ["<leader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
  n = {
    ["<leader>i"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
  },
}

M.telescope = {
  n = {
    ["<leader>gr"] = { "<cmd> Telescope lsp_references <CR>", "show keys" },
    ["<leader>gd"] = { "<cmd> Telescope lsp_definitions <CR>", "show keys" },
  }
}


return M
