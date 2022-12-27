vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require('dap')
      dap.adapters.go = {
        type = 'executable';
        command = 'node';
        args = { os.getenv('HOME') .. '/vscode-go/dist/debugAdapter.js' };
      }
      dap.configurations.go = {
        {
          type = 'go';
          name = 'Debug';
          request = 'launch';
          showLog = false;
          program = "${file}";
          dlvToolPath = vim.fn.exepath('dlv') -- Adjust to where delve is installed
        },
      }
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        fold_open = "v",
        fold_closed = ">",
        mode = "document_diagnostics",
      })
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      local present, colorizer = pcall(require, "colorizer")
      if not present then
        return
      end

      colorizer.setup(
        {
          "*",
        },
        {
          names = false,
        })
    end
  }
  use "wbthomason/packer.nvim"
  use {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require('mason-tool-installer').setup({

        -- a list of all tools you want to ensure are installed upon
        -- start; they should be the names Mason uses for each tool
        ensure_installed = {
          "bash-language-server",
          "dockerfile-language-server",
          "gopls",
          "json-lsp",
          "lua-language-server",
          "sqls",
          "terraform-ls",
          "yaml-language-server",
          "rust-analyzer",
        },
        run_on_start = true,
        start_delay = 1000, -- 3 second delay
      })
    end
  }
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local present, blankline = pcall(require, "indent_blankline")
      if not present then
        return
      end

      blankline.setup({
        indentLine_enabled = 1,
        filetype_exclude = {
          "help",
          "terminal",
          "alpha",
          "packer",
          "lspinfo",
          "TelescopePrompt",
          "TelescopeResults",
          "mason",
          "",
        },
        buftype_exclude = { "terminal" },
        show_trailing_blankline_indent = false,
        show_first_indent_level = false,
        show_current_context = false,
        show_current_context_start = false,
      })
    end
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      local present, lualine = pcall(require, "lualine")
      if not present then
        return
      end

      lualine.setup({
        options = {
          globalstatus = true,
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'filename' },
          lualine_x = { 'searchcount' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' }
        },
      })
    end
  }
  use {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local present, tmux = pcall(require, "nvim-tmux-navigation")

      if not present then
        return
      end

      tmux.setup {
        disable_when_zoomed = true, -- defaults to false
        keybindings = {
          left = "<C-h>",
          down = "<C-j>",
          up = "<C-k>",
          right = "<C-l>",
          last_active = "<C-\\>",
        }
      }
    end
  }
  use {
    "ggandor/leap.nvim",
    config = function()
      local present, leap = pcall(require, "leap")
      if not present then
        return
      end

      leap.add_default_mappings()
    end
  }
  use {
    'lewis6991/impatient.nvim',
    config = function()
      local present, impatient = pcall(require, 'impatient')
      if not present then
        return
      end
    end
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local present, null_ls = pcall(require, "null-ls")
      if not present then
        return
      end

      local b = null_ls.builtins

      local sources = {
        b.formatting.goimports.with({
          args = { "-srcdir", "$DIRNAME", "--local", "github.com/akuity" },
        }),
      }

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(client)
                  return client.name == "null-ls"
                end
              })
            end,
          })
        end
      end

      null_ls.setup({
        debug = true,
        sources = sources,
        on_attach = on_attach,
      })
    end
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      local present, gitsigns = pcall(require, "gitsigns")
      if not present then
        return
      end

      gitsigns.setup({
        signs = {
          add          = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
          change       = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          delete       = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
          changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
          untracked    = { hl = 'GitSignsAdd', text = '┆', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        },
        numhl = true,
      })

    end
  }
  use {
    "neovim/nvim-lspconfig",
    config = function()
      local present, lspconfig = pcall(require, "lspconfig")
      if not present then
        return
      end

      local servers = {
        "bashls",
        "gopls",
        "rust_analyzer",
        "sumneko_lua",
      }

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
              })
            end,
          })
        end
      end

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup({
          on_attach = on_attach,
        })
      end
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local present, telescope = pcall(require, "telescope")
      if not present then
        return
      end

      telescope.setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          path_display = { "absolute" },
          prompt_prefix = " > ",
          show_line = false,
          selection_caret = "  ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
          mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
            },
            i = {
              ["<C-s>"] = "select_vertical",
            },
          }
        },
        pickers = {
          lsp_references = {
            show_line = false,
            results_title = false,
            preview_title = false,
            prompt_title = false,
            jump_type = "never"
          },
          lsp_definitions = {
            show_line = false,
            results_title = false,
            preview_title = false,
            prompt_title = false,
            jump_type = "never"
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
        }
      })
    end
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local present, treesitter = pcall(require, "nvim-treesitter.configs")
      if not present then
        return
      end

      treesitter.setup({
        ensure_installed = {
          "bash",
          "dockerfile",
          "git_rebase",
          "gitignore",
          "go",
          "gomod",
          "gowork",
          "help",
          "javascript",
          "json",
          "jsonnet",
          "lua",
          "make",
          "markdown",
          "rust",
          "sql",
          "vim",
          "yaml",
        },

        highlight = {
          enable = true,
          use_languagetree = true,
        },

        indent = {
          enable = true,
        },
      })
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      local present, ntree = pcall(require, "nvim-tree")
      if not present then
        return
      end

      ntree.setup({
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
          icons = {
            show = {
              folder_arrow = false
            }
          }
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
      })
    end
  }
  use "themercorp/themer.lua"
  use {
    "williamboman/mason.nvim",
    config = function()
      local present, mason = pcall(require, "mason")
      if not present then
        return
      end

      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use {
    "hrsh7th/nvim-cmp",
    config = function()
      local present, cmp = pcall(require, "cmp")
      if not present then
        return
      end
      require("luasnip/loaders/from_vscode").lazy_load()
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = {
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif require("luasnip").expand_or_jumpable() then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif require("luasnip").jumpable(-1) then
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
            else
              fallback()
            end
          end, {
            "i",
            "s",
          }),
        },
        sources = {
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
        },
      })

    end
  }

end)
