return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local catppuccin_theme = require("catppuccin.special.bufferline").get_theme({
				styles = { "bold" },
			})

			local function bufferline_theme()
				local colors = require("catppuccin.palettes").get_palette()
				local highlights = catppuccin_theme()
				local selected = { fg = colors.crust, bg = colors.blue, bold = true }
				local visible = { fg = colors.crust, bg = colors.blue }

				for name, highlight in pairs(highlights) do
					if name:match("_selected$") or name:match("_visible$") then
						highlight.bg = colors.blue
					end
				end

				highlights.buffer_selected = selected
				highlights.duplicate_selected = selected
				highlights.numbers_selected = selected
				highlights.pick_selected = selected
				highlights.buffer_visible = visible
				highlights.duplicate_visible = visible
				highlights.numbers_visible = visible
				highlights.pick_visible = visible
				highlights.indicator_selected = { fg = colors.blue, bg = colors.blue }
				highlights.separator_selected = { fg = colors.crust, bg = colors.blue }
				highlights.modified_selected = { fg = colors.peach, bg = colors.blue, bold = true }
				highlights.error_selected = { fg = colors.red, bg = colors.blue, bold = true }
				highlights.error_diagnostic_selected = { fg = colors.red, bg = colors.blue }
				highlights.warning_selected = { fg = colors.yellow, bg = colors.blue, bold = true }
				highlights.warning_diagnostic_selected = { fg = colors.yellow, bg = colors.blue }

				return highlights
			end

			require("bufferline").setup({
				highlights = bufferline_theme,
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
						style = "none",
					},
					separator_style = "thin",
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
