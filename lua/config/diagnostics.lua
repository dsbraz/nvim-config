local float_options = {
	border = "rounded",
	header = "",
	source = "if_many",
}

vim.keymap.set("n", "<leader>xd", function()
	vim.diagnostic.open_float(vim.tbl_extend("force", float_options, {
		scope = "cursor",
	}))
end, { desc = "Diagnostic under cursor" })

vim.opt.mousemoveevent = true

local hover_delay = 300
local hover_generation = 0
local hover_window

local function close_hover()
	if hover_window and vim.api.nvim_win_is_valid(hover_window) then
		vim.api.nvim_win_close(hover_window, false)
	end

	hover_window = nil
end

vim.keymap.set("n", "<MouseMove>", function()
	hover_generation = hover_generation + 1
	local generation = hover_generation
	local mouse = vim.fn.getmousepos()

	close_hover()

	if mouse.winid == 0 or mouse.line == 0 or mouse.column == 0 then
		return
	end

	if not vim.api.nvim_win_is_valid(mouse.winid) then
		return
	end

	local window_config = vim.api.nvim_win_get_config(mouse.winid)
	if window_config.relative ~= "" then
		return
	end

	vim.defer_fn(function()
		if generation ~= hover_generation then
			return
		end

		local current_mouse = vim.fn.getmousepos()
		if
			current_mouse.winid ~= mouse.winid
			or current_mouse.line ~= mouse.line
			or current_mouse.column ~= mouse.column
			or not vim.api.nvim_win_is_valid(mouse.winid)
		then
			return
		end

		local bufnr = vim.api.nvim_win_get_buf(mouse.winid)

		vim.api.nvim_win_call(mouse.winid, function()
			local _, window = vim.diagnostic.open_float(vim.tbl_extend("force", float_options, {
				bufnr = bufnr,
				close_events = { "CursorMoved", "CursorMovedI", "InsertCharPre", "InsertEnter" },
				focus = false,
				focusable = false,
				pos = { mouse.line - 1, mouse.column - 1 },
				relative = "mouse",
				scope = "cursor",
			}))

			hover_window = window
		end)
	end, hover_delay)
end, { desc = "Show diagnostic on mouse hover", silent = true })
