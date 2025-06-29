return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
          runner = "pytest",
          args = { "-vv", "--tb=long", "--assert=plain", "--ignore-glob=**/.null-ls_*", "pytest_unittests" },
          python = "venv/bin/python",
          env = {
            PYTHONPATH = vim.fn.getcwd(), -- Adds current project root to import path
          },
        }),
      },
      icons = {
        running = "",
        passed = "",
        failed = "",
        skipped = "",
      },
      status = {
        signs = true,
      },
    })
    vim.keymap.set("n", "<leader>tn", function()
      require("neotest").run.run()
    end, { desc = "Run nearest test" })
    vim.keymap.set("n", "<leader>tN", function()
      require("neotest").run.run({ strategy = "dap" })
    end, { desc = "Debug nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end, { desc = "Run tests in file" })
    vim.keymap.set("n", "<leader>tF", function()
      require("neotest").run.run({ strategy = "dap", path = vim.fn.expand("%") })
    end, { desc = "Debug tests in file" })

    vim.keymap.set("n", "<leader>ts", function()
      require("neotest").summary.toggle()
    end, { desc = "Toggle test summary" })

    vim.keymap.set("n", "<leader>ta", function()
      require("neotest").run.attach()
    end, { desc = "Attach to test" })

    vim.keymap.set("n", "<leader>tS", function()
      require("neotest").run.stop()
    end, { desc = "Stop running tests" })

    vim.keymap.set("n", "<leader>tR", function()
      require("neotest").run.run({ suite = true })
    end, { desc = "Run all tests in suite" })
    vim.keymap.set("n", "<leader>tD", function()
      require("neotest").run.run({ strategy = "dap", suite = true })
    end, { desc = "Debug all tests in suite" })
  end,
}
