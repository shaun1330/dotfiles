return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ensure_installed = {
					"mypy",
					"ruff",
				},
			})
		end,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"bashls",
					"biome",
					"pylsp",
					"ruff",
          "pyright"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.biome.setup({ capabilities = capabilities })
			lspconfig.ruff.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
      vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
