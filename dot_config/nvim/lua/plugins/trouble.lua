local present, trouble = pcall(require, "trouble")

if not present then
  return
end

trouble.setup({
  fold_open = "v",
  fold_closed = ">",
  mode = "document_diagnostics",
})
