vim.keymap.set("n", "<leader>wm", function()
  -- Get current file and line
  local file = vim.fn.expand("%")
  local line = vim.fn.line(".")
  -- Get the commit hash for the current line
  local blame = vim.fn.systemlist({ "git", "blame", "-L", line .. "," .. line, "--porcelain", file })
  if not blame or #blame == 0 then return end
  local commit = blame[1]:match("^(%w+)")
  if not commit or #commit == 0 then return end

  -- Get current branch name
  local branch = vim.fn.systemlist({ "git", "rev-parse", "--abbrev-ref", "HEAD" })[1]

  -- Run the git log command
  local log = vim.fn.systemlist({ "git", "log", "--merges", "--ancestry-path", commit .. ".." .. branch })
  local lines = vim.list_slice(log, 1, 6)
  if #lines == 0 then lines = { "No merge found." } end

  -- Show result in floating window
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local win = vim.api.nvim_open_win(buf, false, {
    relative = "cursor",
    width = 80,
    height = math.min(#lines, 10),
    col = 0,
    row = 1,
    anchor = "NW",
    style = "minimal",
    border = "rounded",
  })

  -- Auto-close on cursor move or insert
  vim.api.nvim_create_autocmd({ "CursorMoved", "BufHidden", "InsertCharPre" }, {
    once = true,
    callback = function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end,
  })
end, { desc = "Show merge commit for line" })

