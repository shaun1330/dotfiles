
local script_path = "/Users/simonss/scripts/available-scripts/polygon-kms-server/run_server.sh"

local M = {}

M.run_server = function(debug)
  local args = { script_path }
  if debug then
    table.insert(args, "--debug")
  end
  vim.fn.jobstart(args, { detach = true })
  print("Server started with debug mode: " .. tostring(debug))
end

return M
