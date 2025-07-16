local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local instance_dir = "/Users/simonss/projects/polygon-central/instance"
local script_path = "/Users/simonss/scripts/available-scripts/polygon-central/run_server.sh"

local M = {}

M.run_server = function(debug)
  local files = vim.fn.globpath(instance_dir, "*", false, true)

  pickers.new({}, {
    prompt_title = "Select Instance File",
    finder = finders.new_table {
      results = vim.tbl_map(function(path)
        return vim.fn.fnamemodify(path, ":t")
      end, files),
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      local on_select = function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if not selection then
          print("No selection")
          return
        end

        local args = { script_path, selection.value }
        if debug then
          table.insert(args, "--debug")
        end

        print("Starting server with args: " .. vim.inspect(args))
        vim.notify("Starting server with args: " .. vim.inspect(args), vim.log.levels.INFO)

        vim.fn.jobstart(args, { detach = true })
      end

      map("i", "<CR>", on_select)
      map("n", "<CR>", on_select)

      return true
    end,
  }):find()
end

return M
