local present, go_vim = pcall(require, "go")

if not present then
  return
end

go_vim.setup {}
