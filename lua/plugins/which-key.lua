return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")

			wk.setup()
			wk.add({
				{ "<leader>a", desc = "Harpoon add file" },
				{ "<leader>bd", desc = "Close buffer" },
				{ "<leader>c", group = "Code" },
				{ "<leader>cf", desc = "Format file" },
				{ "<leader>cl", desc = "LSP references" },
				{ "<leader>cs", desc = "Symbols" },
				{ "<leader>e", desc = "Toggle tree" },
				{ "<leader>f", group = "Find" },
				{ "<leader>fb", desc = "Find buffers" },
				{ "<leader>ff", desc = "Find files" },
				{ "<leader>fg", desc = "Live grep" },
				{ "<leader>fh", desc = "Help tags" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gB", desc = "Git blame details" },
				{ "<leader>gb", desc = "Toggle git blame" },
				{ "<leader>rn", desc = "Rename symbol" },
				{ "<leader>x", group = "Diagnostics" },
				{ "<leader>xX", desc = "Buffer diagnostics" },
				{ "<leader>xx", desc = "Diagnostics" },
			})
		end,
	},
}
