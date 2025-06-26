return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sf", builtin.find_files, {})
      vim.keymap.set("n", "<leader>ff", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            "miniconda3/.*",
            "%.git/",
            "%.jpg",
            "%.png",
          },
          mappings = {
            i = {
              ["<C-d>"] = require("telescope.actions").delete_buffer,
            },
            n = {
              ["<C-d>"] = require("telescope.actions").delete_buffer,
            }
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
