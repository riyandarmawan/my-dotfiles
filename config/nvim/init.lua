-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Enable transparency in Neovim
vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
]])

-- Make NeoTree transparent
vim.cmd([[
  hi NormalNC guibg=NONE ctermbg=NONE
  hi NeoTreeNormal guibg=NONE ctermbg=NONE
  hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
]])
