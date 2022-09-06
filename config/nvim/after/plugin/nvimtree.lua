local Remap = require("ncasco.keymap")
local nnoremap = Remap.nnoremap

vim.api.nvim_set_var("nvim_tree_indent_markers", 1)
vim.api.nvim_set_var("nvim_tree_group_empty", 0)

nnoremap("<C-n>", ":NvimTreeToggle<CR>")
