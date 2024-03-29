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
