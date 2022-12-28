vim.cmd [[packadd packer.nvim]]

require("packer").startup({ function(use)
  use {
    "goolord/alpha-nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
  }
  use "ray-x/lsp_signature.nvim"
  use "glepnir/lspsaga.nvim"
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  }
  use "numToStr/Comment.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "wbthomason/packer.nvim"
  use "WhoIsSethDaniel/mason-tool-installer.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "windwp/nvim-autopairs"
  use "kyazdani42/nvim-web-devicons"
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  }
  use "alexghergh/nvim-tmux-navigation"
  use "lewis6991/impatient.nvim"
  use "jose-elias-alvarez/null-ls.nvim"
  use "lewis6991/gitsigns.nvim"
  use "neovim/nvim-lspconfig"
  use "nvim-lua/plenary.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  }
  use "nvim-treesitter/nvim-treesitter"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  }
  use "themercorp/themer.lua"
  use "williamboman/mason.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/nvim-cmp"
end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end
    }
  }
})

require("plugins.impatient")
require("plugins.alpha")
require("plugins.autopairs")
require("plugins.blankline")
require("plugins.cmp")
require("plugins.colorizer")
require("plugins.comment")
require("plugins.gitsigns")
require("plugins.lsp-signature")
require("plugins.lspconfig")
require("plugins.lspsaga")
require("plugins.lualine")
require("plugins.mason-tool-installer")
require("plugins.mason")
require("plugins.null-ls")
require("plugins.telescope")
require("plugins.themer")
require("plugins.tmux")
require("plugins.tree")
require("plugins.treesitter")
require("plugins.trouble")
