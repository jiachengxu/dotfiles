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
