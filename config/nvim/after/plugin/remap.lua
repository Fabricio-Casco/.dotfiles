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

-- TODO arreglar esto
-- Special characters
function hello()
  print ("hello")
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. 'hello' .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end
inoremap("<M-n>", hello)
inoremap("<M-N>", "Ñ")
inoremap("<M-a>", "á")
inoremap("<M-e>", "é")
inoremap("<M-i>", "í")
inoremap("<M-o>", "ó")
inoremap("<M-u>", "ú")
inoremap("<M-A>", "Á")
inoremap("<M-E>", "É")
inoremap("<M-I>", "Í")
inoremap("<M-O>", "Ó")
inoremap("<M-U>", "Ú")

-- Jumplist mutations
--nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
--nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
