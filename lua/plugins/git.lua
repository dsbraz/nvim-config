return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 500,
					virt_text = true,
					virt_text_pos = "eol",
				},
				current_line_blame_formatter = " <author>, <author_time:%R> - <summary>",
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, {
						buffer = bufnr,
						desc = "Toggle git blame",
					})
					vim.keymap.set("n", "<leader>gB", function()
						gitsigns.blame_line({ full = true })
					end, {
						buffer = bufnr,
						desc = "Git blame details",
					})
				end,
			})
		end,
	},
}
