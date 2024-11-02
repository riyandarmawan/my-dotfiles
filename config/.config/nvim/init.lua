-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Enable true color support
vim.opt.termguicolors = true

-- Set background transparency
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
