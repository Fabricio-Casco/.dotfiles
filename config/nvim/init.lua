require("ncasco")

local augroup = vim.api.nvim_create_augroup
ncascoGroup = augroup('ncasco', {})

local autocmd = vim.api.nvim_create_autocmd
autocmd({"BufWritePre"}, {
	group = ncascoGroup,
	pattern = "*",
	command = "%s/\\s\\+$//e"
})
