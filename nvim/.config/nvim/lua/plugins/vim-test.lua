return {
  "vim-test/vim-test",
  vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>"),
  vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>"),
  vim.keymap.set("n", "<leader>tf", ":TestFile<CR>"),
}
