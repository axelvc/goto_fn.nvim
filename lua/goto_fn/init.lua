local M = {}
local U = require 'goto_fn.utils'

function M.goto_start()
	local node = U.get_function_node()

	if not node then
		return
	end

	local row = node:range()
  local cursor_col = vim.api.nvim_win_get_cursor(0)[2]
  row = row + 1
  cursor_col = cursor_col + 1

	vim.api.nvim_win_set_cursor(0, { row, cursor_col })
end

return M
