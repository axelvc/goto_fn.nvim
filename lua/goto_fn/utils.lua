local M = {}

function M.get_cusor_node()
	if vim.treesitter.get_node then
		return vim.treesitter.get_node()
	else
		return require("nvim-treesitter.ts_utils").get_node_at_cursor()
	end
end

---@return TSNode | nil
function M.get_function_node()
	local node = M.get_cusor_node()

	while node do
		if node:type() == "function_declaration" or node:type() == "method_definition" then
			return node
		end

		node = node:parent()
	end
end

function M.set_console()
	local node = M.get_function_node()

	if not node then
		return
	end

	local params = M.get_parameters(node)
	local line = M.get_console_line(params)

	vim.api.nvim_put({ line }, "l", true, true)
end

return M
