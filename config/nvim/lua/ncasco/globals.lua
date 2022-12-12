local ok, plenary_reload = pcall(require, "plenary.reload")
if not ok then
  reloader = require
else
  reloader = plenary_reload.reload_module
end

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return reloader(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

local function bind(op, outer_opts)
  outer_opts = outer_opts or {noremap = true}
  return function(lhs, rhs, opts)
    opts = vim.tbl_extend("force",
    outer_opts,
    opts or {}
    )
    vim.keymap.set(op, lhs, rhs, opts)
  end
end

NMAP = bind("n", {noremap = false})
NNOREMAP = bind("n")
VNOREMAP = bind("v")
XNOREMAP = bind("x")
INOREMAP = bind("i")
CNOREMAP = bind("c")
