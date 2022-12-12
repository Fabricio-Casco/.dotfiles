-- Netrw
NNOREMAP("<leader>pv", "<cmd>Ex<CR>")

-- Scroll
NNOREMAP("<UP>", "<C-y>")
NNOREMAP("<Down>", "<C-e>")
NNOREMAP("<C-d>", "<C-d>zz")
NNOREMAP("<C-u>", "<C-u>zz")

-- Moove between split windows
NNOREMAP("<leader>h", "<C-W><C-H>")
NNOREMAP("<leader>j", "<C-W><C-J>")
NNOREMAP("<leader>k", "<C-W><C-K>")
NNOREMAP("<leader>l", "<C-W><C-L>")
-- Make splits the same size
NNOREMAP("<leader>=", "<C-w>=")
-- Sizing windows
NNOREMAP("<C-Up>", "<C-W>2+")
NNOREMAP("<C-Down>", "<C-W>2-")
NNOREMAP("<leader>+", "<C-W>10>")
NNOREMAP("<leader>-", "<C-W>10<")

-- Use null registers for the next delete or copy
NNOREMAP("<leader>d", "\"_d")
NNOREMAP("<leader>c", "\"_c")
XNOREMAP("<leader>p", "\"_dP")
VNOREMAP("<leader>d", "\"_d")
VNOREMAP("<leader>c", "\"_c")
VNOREMAP("<leader>p", "\"_dP")

-- Moove lines
INOREMAP("<M-j>", "<Esc>:m .+1<CR>==gi")
INOREMAP("<M-k>", "<Esc>:m .-2<CR>==gi")
VNOREMAP("<M-j>", ":m '>+1<CR>gv=gv")
VNOREMAP("<M-k>", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when jumping
NNOREMAP("n", "nzzzv")
NNOREMAP("N", "Nzzzv")
NNOREMAP("J", "mzJ`z")

-- Undo break points
INOREMAP(",", ",<C-g>u")
INOREMAP(".", ".<C-g>u")
INOREMAP("!", "!<C-g>u")
INOREMAP("?", "?<C-g>u")

--Run the last command
NNOREMAP("!!", ":<up>")

-- Special characters
INOREMAP("<M-a>", "á")
INOREMAP("<M-e>", "é")
INOREMAP("<M-i>", "í")
INOREMAP("<M-o>", "ó")
INOREMAP("<M-u>", "ú")
INOREMAP("<M-n>", "ñ")
INOREMAP("<M-A>", "Á")
INOREMAP("<M-E>", "É")
INOREMAP("<M-I>", "Í")
INOREMAP("<M-O>", "Ó")
INOREMAP("<M-U>", "Ú")
INOREMAP("<M-N>", "Ñ")

-- Jumplist mutations
--NNOREMAP <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
--NNOREMAP <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
