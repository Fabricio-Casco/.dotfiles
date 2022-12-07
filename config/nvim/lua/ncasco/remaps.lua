local Remap = require("ncasco.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Netrw
nnoremap("<leader>pv", "<cmd>Ex<CR>")

-- Scroll
nnoremap("<UP>", "<C-y>")
nnoremap("<Down>", "<C-e>")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- Moove between split windows
nnoremap("<leader>h", "<C-W><C-H>")
nnoremap("<leader>j", "<C-W><C-J>")
nnoremap("<leader>k", "<C-W><C-K>")
nnoremap("<leader>l", "<C-W><C-L>")
-- Make splits the same size
nnoremap("<leader>=", "<C-w>=")
-- Sizing windows
nnoremap("<leader>-", "<C-W>5<")
nnoremap("<leader>+", "<C-W>5>")

-- Use null registers for the next delete or copy
nnoremap("<leader>d", "\"_d")
nnoremap("<leader>c", "\"_c")
xnoremap("<leader>p", "\"_dP")
vnoremap("<leader>d", "\"_d")
vnoremap("<leader>c", "\"_c")
vnoremap("<leader>p", "\"_dP")

-- Moove lines
inoremap("<M-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<M-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<M-j>", ":m '>+1<CR>gv=gv")
vnoremap("<M-k>", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when jumping
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- Undo break points
inoremap(",", ",<C-g>u")
inoremap(".", ".<C-g>u")
inoremap("!", "!<C-g>u")
inoremap("?", "?<C-g>u")

--Run the last command
nnoremap("!!", ":<up>")

-- Special characters
inoremap("<M-a>", "á")
inoremap("<M-e>", "é")
inoremap("<M-i>", "í")
inoremap("<M-o>", "ó")
inoremap("<M-u>", "ú")
inoremap("<M-n>", "ñ")
inoremap("<M-A>", "Á")
inoremap("<M-E>", "É")
inoremap("<M-I>", "Í")
inoremap("<M-O>", "Ó")
inoremap("<M-U>", "Ú")
inoremap("<M-N>", "Ñ")

-- Jumplist mutations
--nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
--nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
