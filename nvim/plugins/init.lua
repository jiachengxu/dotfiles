local overrides = require "custom.plugins.overrides"

return {

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  ["NvChad/ui"] = {
    override_options = overrides.ui,
  },
  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = {
        "bash-language-server",
        "dockerfile-language-server",
        "goimports-reviser",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "sqls",
        "terraform-ls",
        "yaml-language-server",
      },
    },
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },
  ["ggandor/leap.nvim"] = {
    config = function()
      require "custom.plugins.leap"
    end,
  },
  ["rafamadriz/friendly-snippets"] = {},
  ["alexghergh/nvim-tmux-navigation"] = {
    config = function()
      require "custom.plugins.tmux"
    end,
  },
}
