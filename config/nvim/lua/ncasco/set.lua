vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.scrolloff = 8

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

--vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.exrc = true
vim.opt.errorbells = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 50

vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.shortmess:append("c")

vim.g.mapleader = " "
