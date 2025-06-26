
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='Error', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➡️', texthl='Success', linehl='DapStoppedLine', numhl='DapStoppedLine'})
vim.fn.sign_define('DapBreakpointRejected', {text='⚠️', texthl='WarningMsg', linehl='', numhl=''})

vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#3c3836', underline = true })
vim.fn.sign_define('DapStopped', {
  text='▶️',
  texthl='DapStopped',
  linehl='DapStoppedLine',
  numhl='DapStoppedLine'
})


vim.opt.rtp:prepend(lazypath)
-- Setup lazy.nvim
require("vim-options")
require("lazy").setup("plugins")




