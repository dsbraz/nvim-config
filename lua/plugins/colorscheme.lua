return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- Let Neovim detect background changes from the terminal, including over SSH.
			-- Setting vim.o.background explicitly disables that automatic detection.
			require("catppuccin").setup({
				flavour = "auto",
				background = {
					light = "latte",
					dark = "mocha",
				},
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
