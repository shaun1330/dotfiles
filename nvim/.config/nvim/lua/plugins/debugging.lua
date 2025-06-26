return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_python = require("dap-python")
    dap_python.setup(".venv/bin/python") -- Adjust the path to your Python interpreter
    dap.adapters.python = {
      type = 'server',
      host = '127.0.0.1',
      port = 5678,
    }

    dap.configurations.python = {
      {
        type = 'python',
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
            localRoot = vim.fn.getcwd(), -- your project root
            remoteRoot = vim.fn.getcwd(),
          },
        },
      }
    }

    dapui.setup(
      {
        highlights = {
          -- Apply the background to these groups
          Scope = "DapUIBackground",
          Variable = "DapUIBackground",
          Breakpoints = "DapUIBackground",
          Stacks = "DapUIBackground",
          Watches = "DapUIBackground",
          REPL = "DapUIBackground",
          Console = "DapUIBackground",
        },
      }
    )
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
  end,
}
