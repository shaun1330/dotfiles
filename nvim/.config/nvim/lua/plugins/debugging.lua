return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    vim.fn.mkdir(vim.fn.stdpath("cache") .. "/dap", "p")
    local dap = require("dap")
    dap.set_log_level("TRACE")
    local dapui = require("dapui")
    local dap_python = require("dap-python")
    dap_python.setup("venv/bin/python")
    dap.adapters.python_server = {
      type = 'server',
      host = '127.0.0.1',
      port = 5678,
    }
    dap.adapters.python_exec = {
      type = 'executable',
      command = "venv/bin/python",
      args = { "-m", "debugpy.adapter" },
      justMyCode = false,
    }

    dap.configurations.python = {
      {
        type = 'python_server',
        request = 'attach',
        name = 'Attach to server',
        connect = {
          host = '127.0.0.1',
          port = 5678,
        },
        mode = 'remote',
        justMyCode = false,
        pathMappings = {
          {
            localRoot = vim.fn.getcwd(),
            remoteRoot = vim.fn.getcwd(),
          },
        },
      },
      {
        name = "Launch (local)",
        type = "python_exec",
        request = "launch",
        program = "${file}",
        pythonPath = "venv/bin/python",
      },
    }

    dapui.setup()

    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.after.event_initialized["dapui_config"] = function()
      vim.schedule(dapui.open)
    end
    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    vim.keymap.set("n", "<Leader>du", dapui.toggle, {})
  end
}
