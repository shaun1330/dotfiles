return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require("dashboard").setup {
      theme = "hyper",
      config = {
        header = {
          [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
          [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
          [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
          [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
          [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
          [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        },
        shortcut = {
          { desc = "  Recent Files", group = "@property", action = "Telescope oldfiles", key = "r" },
          { desc = "  Files", group = "@property", action = "Telescope find_files", key = "f" },
          { desc = "  Plugins", group = "@property", action = "Lazy", key = "l" },
        },
        footer = { "🚀 Code. Debug. Repeat." },
      },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
