local Remap = require("ncasco.keymap")
local nnoremap = Remap.nnoremap

local ok, harpoon = pcall(require, "harpoon")

if not ok then
  return
end

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

harpoon.setup {}

nnoremap("<leader>a", function()
  mark.add_file()
end)
nnoremap("<C-e>", function()
  ui.toggle_quick_menu()
end)

nnoremap("<leader>1", function()
  ui.nav_file(1)
end)
nnoremap("<leader>2",function()
  ui.nav_file(2)
end)
nnoremap("<leader>3", function()
  ui.nav_file(3)
end)
nnoremap("<leader>4", function()
  ui.nav_file(4)
end)
