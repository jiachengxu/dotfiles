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
