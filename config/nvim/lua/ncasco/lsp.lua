local Remap = require("ncasco.keymap")
local nnoremap = Remap.nnoremap

local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    --capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function()
      nnoremap("K", function() vim.lsp.buf.hover() end)
      nnoremap("gd", function() vim.lsp.buf.definition() end)
      nnoremap("gt", function() vim.lsp.buf.type_definition() end)
      nnoremap("<leader>vii", function() vim.lsp.buf.implementation() end)
      nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
      nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
      nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
    end,
  }, _config or {})
end

--npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup(config({
  root_dir = require'lspconfig'.util.root_pattern("package.json")
}))

--Rust
require("lspconfig").rust_analyzer.setup(config({
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}))

--Lua
require("lspconfig").sumneko_lua.setup(config({
  --cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}))

--npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup(config())
require'lspconfig'.cssls.setup(config())
require'lspconfig'.jsonls.setup(config())
--require'lspconfig'.eslint.setup(config())

require'lspconfig'.denols.setup(config({
  root_dir = require'lspconfig'.util.root_pattern("deno.json", "deno.jsonc"),
}))

--yarn global add diagnostic-languageserver
--require'lspconfig'.diagnosticls.setup(config())

--npm install -g dockerfile-language-server-nodejs
--require'lspconfig'.dockerls.setup(config())

--:OmnisharpInstall
--local pid = vim.fn.getpid()
--require'lspconfig'.omnisharp.setup(config({
    --cmd = { "/home/fcasco/.cache/omnisharp-vim/omnisharp-roslyn/run", "--languageserver" , "--hostPID", tostring(pid) };
--}))
