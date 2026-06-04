return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.workspace = capabilities.workspace or {}
			capabilities.workspace.didChangeWatchedFiles = capabilities.workspace.didChangeWatchedFiles or {}
			capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "pyright", "ts_ls" },
				automatic_enable = true,
			})
		end,
	},
}
