return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter_languages = { "lua", "vim", "vimdoc", "go", "python", "javascript", "typescript" }

			require("nvim-treesitter").setup()
			require("nvim-treesitter").install(treesitter_languages)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = treesitter_languages,
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
}
