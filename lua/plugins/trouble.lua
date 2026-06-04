return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup()

			vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
			vim.keymap.set(
				"n",
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
				{ desc = "Buffer diagnostics" }
			)
			vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle<CR>", { desc = "Symbols" })
			vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle<CR>", { desc = "LSP references" })
		end,
	},
}
