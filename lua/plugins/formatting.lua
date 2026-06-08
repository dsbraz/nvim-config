return {
	{
		"stevearc/conform.nvim",
		dependencies = { "williamboman/mason.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = { "stylua", "prettier", "black", "goimports", "gofumpt" },
			})

			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "black" },
					go = { "goimports", "gofumpt" },
					javascript = { "prettier" },
					javascriptreact = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					json = { "prettier" },
					markdown = { "prettier" },
					yaml = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 3000,
					lsp_format = "fallback",
				},
			})

			vim.keymap.set("n", "<leader>cf", function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end, { desc = "Format file" })
		end,
	},
}
