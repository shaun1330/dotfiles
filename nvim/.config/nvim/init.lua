-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.termguicolors = true

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>n", ":NERDTreeFocus<CR>")
vim.keymap.set("n", "<C-n>", ":NERDTree<CR>")
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>")
vim.keymap.set("n", "<C-f>", ":NERDTreeFind<CR>")
