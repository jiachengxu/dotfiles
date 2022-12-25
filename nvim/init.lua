vim.g.mapleader = ","

-- disable default diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = false })
-- use hover window for displaying diagnostics
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.wo.number = true
vim.wo.relativenumber = true
