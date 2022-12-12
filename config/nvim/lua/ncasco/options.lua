local opt = vim.opt

opt.relativenumber = true
opt.nu = true
local group = vim.api.nvim_create_augroup("LineNumberControl", { clear = true })
local set_line_number = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.relativenumber = value
    end,
  })
end
set_line_number("WinLeave", false)
set_line_number("WinEnter", true)


opt.scrolloff = 8
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

--opt.colorcolumn = "80"
opt.signcolumn = "yes"
opt.autoindent = true
opt.cindent = true
opt.wrap = false

opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.showmatch = true

opt.exrc = true
opt.errorbells = false
opt.belloff = "all"
opt.swapfile = false
opt.shada = { "!", "'1000", "<50", "s10", "h" }
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.showcmd = true
opt.cmdheight = 2
opt.updatetime = 50

opt.termguicolors = true
opt.showmode = false
opt.equalalways = false
opt.splitright = true
opt.splitbelow = false

opt.completeopt = {"menu","menuone","noinsert","noselect"}
opt.shortmess:append("c")

-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore:append { "*.o", "*~", "*.pyc", "*pycache*" }
opt.wildignore:append "Cargo.lock"

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

opt.foldmethod = "marker"
opt.foldlevel = 0
opt.modelines = 1

opt.clipboard = "unnamedplus"

opt.mouse = "a"

-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false

vim.opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }
