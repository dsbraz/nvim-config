return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				highlights = require("catppuccin.special.bufferline").get_theme({
					styles = { "bold" },
				}),
				options = {
					mode = "buffers",
					numbers = "none",
					diagnostics = "nvim_lsp",
					diagnostics_update_in_insert = false,
					diagnostics_indicator = function(_, _, diagnostics)
						local indicators = {}
						if diagnostics.error then
							table.insert(indicators, " " .. diagnostics.error)
						end
						if diagnostics.warning then
							table.insert(indicators, " " .. diagnostics.warning)
						end
						return #indicators > 0 and " " .. table.concat(indicators, " ") or ""
					end,
					indicator = {
						style = "underline",
					},
					separator_style = "slant",
					modified_icon = "● ",
					always_show_bufferline = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					offsets = {
						{
							filetype = "NvimTree",
							text = "Files",
							highlight = "Directory",
							text_align = "left",
							separator = true,
						},
					},
				},
			})
		end,
	},
}
