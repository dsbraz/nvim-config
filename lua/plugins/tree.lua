return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local tree_width = 30

			local function remember_tree_width()
				local winid = require("nvim-tree.api").tree.winid()
				if winid and vim.api.nvim_win_is_valid(winid) then
					tree_width = vim.api.nvim_win_get_width(winid)
				end
			end

			require("nvim-tree").setup({
				actions = {
					open_file = {
						resize_window = false,
					},
				},
				filesystem_watchers = {
					enable = true,
				},
				view = {
					width = function()
						return tree_width
					end,
				},
			})

			vim.api.nvim_create_autocmd("WinResized", {
				group = vim.api.nvim_create_augroup("RememberNvimTreeWidth", { clear = true }),
				callback = remember_tree_width,
			})

			vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree View" })
			vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree View" })
		end,
	},
}
