local function close_buffer_keep_window()
	local current = vim.api.nvim_get_current_buf()
	local alternate = vim.fn.bufnr("#")

	if alternate ~= current and vim.fn.buflisted(alternate) == 1 then
		vim.cmd.buffer(alternate)
	else
		local target

		for _, buffer in ipairs(vim.fn.getbufinfo({ buflisted = 1 })) do
			if buffer.bufnr ~= current then
				target = buffer.bufnr
				break
			end
		end

		if target then
			vim.cmd.buffer(target)
		else
			vim.cmd.enew()
		end
	end

	local ok = pcall(vim.cmd, "bdelete " .. current)
	if not ok and vim.api.nvim_buf_is_valid(current) then
		vim.cmd.buffer(current)
	end
end

vim.keymap.set("n", "<leader>bd", close_buffer_keep_window, { desc = "Close buffer" })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local opts = { buffer = args.buf }

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})
