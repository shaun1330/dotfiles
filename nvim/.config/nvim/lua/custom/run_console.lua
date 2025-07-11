local server_scripts = {
  ["/Users/simonss/projects/polygon-central"] = function()
    require("custom.run_polygon-central-console").run_console()
  end,
}

local M = {}

M.run_console = function()
  local cwd = vim.fn.getcwd()

  for project_root, run_fn in pairs(server_scripts) do
    if cwd:find(project_root, 1, true) == 1 then
      run_fn()
      return
    end
  end

  vim.notify("No console script configured for this project", vim.log.levels.WARN)
end

return M

