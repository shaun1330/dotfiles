vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.relativenumber = true
vim.opt.number = true

vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

vim.opt.textwidth = 120
vim.opt.colorcolumn = "120"

vim.api.nvim_set_hl(0, "DapUIBackground", { bg = "#2e3440" })  -- change to your preferred color
vim.g["test#python#runner"] = "pytest"
vim.g["test#python#pytest#options"] = "-vv"
vim.g["test#basic#start_normal"] = 1
vim.g["test#preserve_screen"] = 1
vim.g["test#neovim#start_normal"] = 1
vim.g["test#echo_command"] = 0
vim.g["test#term_position"] = "vertical"

vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-f>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zzzv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "(", "(zzzv")
vim.keymap.set("n", ")", ")zzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>")
vim.keymap.set("n", "<leader>h", ":bprevious<CR>")
vim.keymap.set("n", "<leader>l", ":bnext<CR>")
vim.keymap.set("n", "<C-x>", ":bdelete<CR>")

vim.keymap.set("x", "<leader>p", [["_dP]], {noremap = true, silent = true})

vim.keymap.set("n", "<leader>rs", function()
  require("custom.run_server").run_server(false)
end, { desc = "Run server" })

vim.keymap.set("n", "<leader>rd", function()
  require("custom.run_server").run_server(true)
end, { desc = "Run server (debug)" })

vim.keymap.set("n", "<leader>rc", function()
  require("custom.run_console").run_console()
end, { desc = "Run console" })

require("custom.hover")


local diagnostis_active = false

function _G.toggle_virtual_text()
  diagnostis_active = not diagnostis_active
  vim.diagnostic.config({
    virtual_text = diagnostis_active,
    signs = true,
    underline = true,
  })
  if diagnostis_active then
    print("Virtual text enabled")
  else
    print("Virtual text disabled")
  end
end

vim.keymap.set("n", "<leader>vt", ":lua toggle_virtual_text()<CR>", { desc = "Toggle virtual text" })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightOnYank", {}),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
