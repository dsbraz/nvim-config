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
				ensure_installed = { "gopls", "html", "pyright", "roslyn_ls", "ts_ls" },
				automatic_enable = {
					exclude = { "roslyn_ls" },
				},
			})
		end,
	},
	{
		"seblyng/roslyn.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		opts = {},
	},
}
