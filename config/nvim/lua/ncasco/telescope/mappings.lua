if not pcall(require, "telescope") then
  return
end

local Remap = require("ncasco.keymap")
local nnoremap = Remap.nnoremap

local sorters = require "telescope.sorters"

TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, options, buffer)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  TelescopeMapArgs[map_key] = options or {}

  local mode = "n"
  local rhs = string.format("<cmd>lua R('ncasco.telescope')['%s'](TelescopeMapArgs['%s'])<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  if not buffer then
    vim.api.nvim_set_keymap(mode, key, rhs, map_options)
  else
    vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
  end
end

-- Historial de comandos en command mode
vim.api.nvim_set_keymap("c", "<c-h>", "<Plug>(TelescopeFuzzyCommandSearch)", { noremap = false, nowait = true })

-- Dotfiles
map_tele("<leader>en", "edit_neovim")
map_tele("<leader>ez", "edit_zsh")

-- Search
map_tele("<leader>ps", "grep_prompt")
map_tele("<leader>pw", "grep_string", {
  short_path = true,
  word_match = "-w",
  only_sort_text = true,
  layout_strategy = "vertical",
  sorter = sorters.get_fzy_sorter(),
})
map_tele("<leader>f/", "grep_last_search", {
  layout_strategy = "vertical",
})


-- Files
map_tele("<C-p>", "git_files")
map_tele("<leader>ff", "find_files")
map_tele("<leader>fh", "oldfiles")
map_tele("<leader>fs", "fs")
map_tele("<leader>fv", "find_nvim_source")
map_tele("<leader>fe", "file_browser")
map_tele("<leader>fz", "search_only_certain_files")
map_tele("<leader>fa", "search_all_files")

-- Git
map_tele("<leader>gs", "git_status")
map_tele("<leader>gc", "git_commits")

-- Nvim
map_tele("<leader>fb", "buffers")
map_tele("<leader>fp", "installed_plugins")
map_tele("<leader>fc", "curbuf")
map_tele("<leader>vh", "help_tags")
map_tele("<leader>vo", "vim_options")
map_tele("<leader>wt", "treesitter")

-- Telescope Meta
map_tele("<leader>tm", "builtin")
map_tele("<leader>wsd", "diagnostics")

return map_tele
