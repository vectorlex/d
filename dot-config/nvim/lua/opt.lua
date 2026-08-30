local opt = vim.opt
local o = vim.o

-- 基础
--
opt.number = true
opt.relativenumber = false

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- UI
--
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.wrap = false
opt.showmode = false
opt.fillchars = { eob = " " }
opt.laststatus = 3
opt.splitkeep = "screen"
o.winborder = "rounded"
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    targets = 'msg',
  },
})

-- Others
--
vim.diagnostic.config({ signs = false })
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.undofile = true
opt.clipboard = "unnamedplus"

