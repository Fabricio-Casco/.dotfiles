local Remap = require("ncasco.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- Moove between files
nnoremap("<C-p>", function()
  require('telescope.builtin').git_files()
end)
nnoremap("<C-f>", function()
  require('telescope.builtin').find_files()
end)
nnoremap("<leader>fh", function()
  require('telescope.builtin').oldfiles()
end)

-- Search
nnoremap("<leader>ps", function()
    require('telescope.builtin').grep_string({
      search = vim.fn.input("Grep For > ")
    })
end)
nnoremap("<leader>pw", function()
    require('telescope.builtin').grep_string {
      search = vim.fn.expand("<cword>")
    }
end)

-- GIT
nnoremap("<leader>gc", function()
  require('telescope.builtin').git_commits()
end)
nnoremap("<leader>gb", function()
  require('telescope.builtin').git_branches()
end)
nnoremap("<leader>gs", function()
  require('telescope.builtin').git_status()
end)

-- Helpers
nnoremap("<leader>km", function()
  require('telescope.builtin').keymaps()
end)
nnoremap("<leader>vb", function()
  require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
  require('telescope.builtin').help_tags()
end)
