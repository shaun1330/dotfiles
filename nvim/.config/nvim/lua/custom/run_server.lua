local server_scripts = {
  ["/Users/simonss/projects/polygon-central"] = function(debug)
    require("custom.run_server_polygon-central").run_server(debug)
  end,
  ["/Users/simonss/projects/polygon-kms-server"] = function(debug)
    require("custom.run_server_polygon-kms-server").run_server(debug)
  end,
}

local M = {}

M.run_server = function(debug)
  local cwd = vim.fn.getcwd()

  for project_root, run_fn in pairs(server_scripts) do
    if cwd:find(project_root, 1, true) == 1 then
      run_fn(debug)
      return
    end
  end

  vim.notify("No server script configured for this project", vim.log.levels.WARN)
end

return M

