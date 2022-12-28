local present, saga = pcall(require, "lspsaga")

if not present then
  return
end

saga.init_lsp_saga({
  code_action_lightbulb = {
    enable = false,
  },
})
