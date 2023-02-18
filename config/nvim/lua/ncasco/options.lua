local opt = vim.opt

opt.relativenumber = true
opt.nu = true
opt.scrolloff = 8
opt.cursorline = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.wrap = false

opt.smartindent = true
opt.autoindent = true
opt.cindent = true

--opt.colorcolumn = "80"
opt.signcolumn = "yes"

opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.showmatch = true

opt.equalalways = false
opt.splitright = true
opt.splitbelow = false

opt.exrc = true
opt.errorbells = false
opt.belloff = "all"
opt.swapfile = false
opt.updatetime = 1000
opt.shada = { "!", "'1000", "<50", "s10", "h" }
opt.backup = false

opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.termguicolors = true
opt.showcmd = true
opt.cmdheight = 2
opt.showmode = false

opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.completeopt = {"menu","menuone","noinsert","noselect"}
opt.shortmess:append("c")

opt.wildignore:append "__pycache__"
opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
opt.wildignore:append "Cargo.lock"

-- opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.clipboard = "unnamedplus"

opt.mouse = "a"

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }
