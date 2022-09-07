local Remap = require("ncasco.keymap")
local nnoremap = Remap.nnoremap

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' })
    },

    sources = {
        { name = 'nvim_lsp' },

        -- For luasnip user.
        { name = 'luasnip' },

        { name = 'buffer' },
    }
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      on_attach = function()
        nnoremap("gd", function() vim.lsp.buf.definition() end)
        nnoremap("K", function() vim.lsp.buf.hover() end)
        nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
        nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
        nnoremap("[d", function() vim.diagnostic.goto_next() end)
        nnoremap("]d", function() vim.diagnostic.goto_prev() end)
        nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
        nnoremap("<leader>vco", function() vim.lsp.buf.code_action({
          filter = function(code_action)
            if not code_action or not code_action.data then
              return false
            end

            local data = code_action.data.id
            return string.sub(data, #data - 1, #data) == ":0"
          end,
          apply = true
        }) end)
        nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
        nnoremap("<leader>vii", function() vim.lsp.buf.implementation() end)
        nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
        --inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
      end,
    }, _config or {})
end

--yarn global add diagnostic-languageserver
require'lspconfig'.diagnosticls.setup(config())

--npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup(config())

--:OmnisharpInstall
local pid = vim.fn.getpid()
require'lspconfig'.omnisharp.setup(config({
    cmd = { "/home/fcasco/.cache/omnisharp-vim/omnisharp-roslyn/run", "--languageserver" , "--hostPID", tostring(pid) };
}))

--npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup(config())
require'lspconfig'.cssls.setup(config())
require'lspconfig'.jsonls.setup(config())
--require'lspconfig'.eslint.setup(config())

--npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup(config())

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


local opts = {
    -- whether to highlight the currently hovered symbol
    -- disable if your cpu usage is higher than you want it
    -- or you just hate the highlight
    -- default: true
    highlight_hovered_item = true,

    -- whether to show outline guides
    -- default: true
    show_guides = true,
}

local snippets_paths = function()
    local plugins = { "friendly-snippets" }
    local paths = {}
    local path
    local root_path = vim.env.HOME .. '/.vim/plugged/'
    for _, plug in ipairs(plugins) do
        path = root_path .. plug
        if vim.fn.isdirectory(path) ~= 0 then
            table.insert(paths, path)
        end
    end
    return paths
end

require("luasnip.loaders.from_vscode").lazy_load({
    paths = snippets_paths(),
    include = nil,  -- Load all languages
    exclude = {}
})
