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
