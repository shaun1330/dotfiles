return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enable = true,
    message_template = "<author> <date> <summary>",
    date_format = "%Y-%m-%d %H:%M:%S",
    virtual_text_column = 1,
  },
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "GitBlameToggle" },
 }
}
