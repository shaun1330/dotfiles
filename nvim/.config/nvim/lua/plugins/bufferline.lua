return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				seperator_style = "slant",
				offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
			},
		})
	end,
}
