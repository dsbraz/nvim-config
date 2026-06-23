return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					numbers = "ordinal",
					diagnostics = "nvim_lsp",
					separator_style = "thin",
					show_buffer_close_icons = false,
					show_close_icon = false,
					offsets = {
						{
							filetype = "NvimTree",
							text = "Files",
							separator = true,
						},
					},
				},
			})
		end,
	},
}
