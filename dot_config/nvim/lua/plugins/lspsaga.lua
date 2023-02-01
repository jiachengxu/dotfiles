local present, saga = pcall(require, "lspsaga")

if not present then
  return
end

saga.setup({
  code_action_lightbulb = {
    enable = false,
  },
})
