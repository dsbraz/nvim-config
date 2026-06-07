return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function macro_recording()
				local recording_register = vim.fn.reg_recording()
				if recording_register ~= "" then
					return "recording @" .. recording_register
				end
				return ""
			end

			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
					component_separators = { left = "·", right = "·" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = { "NvimTree", "alpha" },
					},
				},
				sections = {
					lualine_a = {
						{ "mode", separator = { left = "" }, right_padding = 2 },
					},
					lualine_b = {
						{ "branch", icon = "" },
						{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
						{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " } },
						{ macro_recording, color = { fg = "#ff9e64" } },
					},
					lualine_c = {
						{ "filename", path = 1, symbols = { modified = " ●", readonly = " ", unnamed = "[No Name]" } },
						{ "searchcount" },
					},
					lualine_x = {
						{ "filesize" },
						{ "encoding" },
						{ "filetype", icon_only = false },
					},
					lualine_y = { "progress" },
					lualine_z = {
						{ "location", separator = { right = "" }, left_padding = 2 },
					},
				},
				inactive_sections = {
					lualine_a = { "filename" },
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = { "location" },
				},
			})
		end,
	},
}
