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
