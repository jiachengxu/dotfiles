vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.shortmess:append "S"
vim.opt.showcmd = false
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd("colorscheme themer_everforest")
-- vim.cmd("colorscheme themer_gruvbox-material-dark-medium")

-- disable default diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
  { virtual_text = false, underline = false })
-- use hover window for displaying diagnostics
-- vim.o.updatetime = 250
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
local signs = {
  Error = " ",
  Warn = "",
  Hint = "",
  Info = ""
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  if type == "Error" then
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  else
    vim.fn.sign_define(hl, { text = icon, texthl = "", numhl = "" })
  end
end
