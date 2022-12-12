--  ________      ________       ________
-- |\  _____\    |\   ___  \    |\   ____\
-- \ \  \__/     \ \  \\ \  \   \ \  \___|          Fabricio Nicolas Casco
--  \ \   __\     \ \  \\ \  \   \ \  \             Full-stack developer
--   \ \  \_|      \ \  \\ \  \   \ \  \____        https://github.com/ncasco
--    \ \__\        \ \__\\ \__\   \ \_______\
--     \|__|         \|__| \|__|    \|_______|
--
-- patorjk.com/software/taag/


require "ncasco.globals"

require "ncasco.disable_builtin"

vim.g.mapleader = " "
require "ncasco.options"
require "ncasco.remaps"

require'impatient'.enable_profile()

require "ncasco.plugins"


require "ncasco.lsp"
require "ncasco/telescope.setup"
require "ncasco/telescope.mappings"
require "ncasco.file-explorer"


local augroup = vim.api.nvim_create_augroup
local ncascoGroup = augroup('ncasco', {})

local autocmd = vim.api.nvim_create_autocmd
autocmd({"BufWritePre"}, {
	group = ncascoGroup,
	pattern = "*",
	command = "%s/\\s\\+$//e"
})
