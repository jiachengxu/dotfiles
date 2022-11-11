local fn = vim.fn
local sep_style = vim.g.statusline_sep_style
local separators = (type(sep_style) == "table" and sep_style)
    or require("nvchad_ui.icons").statusline_separators[sep_style]
local sep_l = separators["left"]
local M = {}

M.LSP_progress = function()
  return ""
end
M.cwd = function()
  return ""
end
M.LSP_status = function()
  return ""
end
M.cursor_position = function()
  local left_sep = "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#" .. " "

  local current_line = fn.line "."
  local current_col = fn.col "."
  local text = string.format("Row: %d, Col: %d", current_line, current_col)


  return left_sep .. "%#St_pos_text#" .. " " .. text .. " "
end
--
return M
