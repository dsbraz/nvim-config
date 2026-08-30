return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function macro_recording()
				local recording_register = vim.fn.reg_recording()
				if recording_register ~= "" then
					return "󰑋  recording @" .. recording_register
				end
				return ""
			end

			require("lualine").setup({
				options = {
					theme = "catppuccin-nvim",
					globalstatus = true,
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "NvimTree", "alpha" },
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { { "branch", icon = "" } },
					lualine_c = {
						{
							"diagnostics",
							colored = true,
							symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
						{
							"filename",
							path = 1,
							shorting_target = 40,
							symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" },
						},
					},
					lualine_x = {
						{ macro_recording, color = "Statement" },
						{ "searchcount" },
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							color = "Special",
						},
						{
							"diff",
							colored = true,
							symbols = { added = " ", modified = " ", removed = " " },
							source = function()
								local status = vim.b.gitsigns_status_dict
								if status then
									return {
										added = status.added,
										modified = status.changed,
										removed = status.removed,
									}
								end
							end,
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "lazy", "trouble" },
			})
		end,
	},
}
