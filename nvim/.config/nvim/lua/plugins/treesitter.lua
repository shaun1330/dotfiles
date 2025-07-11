return {
  {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldlevel = 99
	end,
 },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0, -- No limit on the number of lines
        trim_scope = "outer", -- Show context from outer scopes
        min_window_height = 0, -- No minimum window height
        mode = "cursor", -- Show context based on cursor position
      })
    end,
  }
}
