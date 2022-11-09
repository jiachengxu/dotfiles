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
  ["ray-x/go.nvim"] = {
    config = function ()
      require "custom.plugins.go-vim"
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
        "sqls",
        "terraform-ls",
        "yaml-language-server",
      },
    },
  },
}
