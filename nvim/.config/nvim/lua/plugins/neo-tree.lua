return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
          enabled = true
        },
				use_libuv_file_watcher = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignore = false,
				},
			},
			buffers = {
				follow_current_file = {
          enabled = true
        },
			},
			window = {
				mappings = {
					["cr"] = "open",
					["C-t"] = "open_tabnew",
					["C-v"] = "open_vsplit",
				},
			},
		})
	end,
}
