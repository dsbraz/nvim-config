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
				local background = macos_appearance()
				local expected_colorscheme = background == "dark" and "catppuccin-mocha" or "catppuccin-latte"

				if vim.o.background == background and vim.g.colors_name == expected_colorscheme then
					return
				end

				vim.o.background = background
				vim.cmd.colorscheme("catppuccin")

				vim.schedule(function()
					if package.loaded["lualine"] then
						require("lualine").setup()
					end
				end)
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
