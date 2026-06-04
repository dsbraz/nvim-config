return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			local function macos_appearance()
				if vim.fn.has("macunix") == 0 then
					return "dark"
				end

				local result = vim.system({ "defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true }):wait()
				return result.code == 0 and vim.trim(result.stdout) == "Dark" and "dark" or "light"
			end

			local function sync_macos_appearance()
				vim.o.background = macos_appearance()
				vim.cmd.colorscheme("catppuccin")
			end

			require("catppuccin").setup({
				flavour = "auto",
				background = {
					light = "latte",
					dark = "mocha",
				},
			})

			sync_macos_appearance()

			vim.api.nvim_create_autocmd({ "FocusGained", "VimEnter" }, {
				group = vim.api.nvim_create_augroup("SyncMacOSAppearance", { clear = true }),
				callback = sync_macos_appearance,
			})
		end,
	},
}
