local present, lualine = pcall(require, "lualine")

if not present then
  return
end

local current_signature = function()
  if not pcall(require, 'lsp_signature') then return end
  local sig = require("lsp_signature").status_line(80)
  return sig.label
end

lualine.setup({
  options = {
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename', '%=', current_signature },
    lualine_x = { 'searchcount' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
})
