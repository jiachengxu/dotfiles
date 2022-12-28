local present, themer = pcall(require, "themer")

if not present then
  return
end

themer.setup({
  enable_installer = true,
  remaps = {
    palette = {
      everforest = {
        accent = "#7FBBB3"
      }
    },
  },
})
