local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Performance
  use 'lewis6991/impatient.nvim'

  -- nvim lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'tjdevries/complextras.nvim'
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim' -- local_use("nvim-telescope", "telescope.nvim")
  use 'nvim-telescope/telescope-rs.nvim' -- local_use("nvim-telescope", "telescope-rs.nvim")
  use 'nvim-telescope/telescope-fzf-writer.nvim' -- local_use("nvim-telescope", "telescope-fzf-writer.nvim")
  use 'nvim-telescope/telescope-packer.nvim' --local_use("nvim-telescope", "telescope-packer.nvim")
  use 'nvim-telescope/telescope-github.nvim' --local_use("nvim-telescope", "telescope-github.nvim")
  use 'nvim-telescope/telescope-symbols.nvim' --local_use("nvim-telescope", "telescope-symbols.nvim")
  -- use { "tami5/sql.nvim" }
  -- use { "tami5/sqlite.lua" }
  use { "nvim-telescope/telescope-smart-history.nvim" }
  use "nvim-telescope/telescope-frecency.nvim"
  -- use "nvim-telescope/telescope-cheat.nvim"
  -- use { "nvim-telescope/telescope-arecibo.nvim", rocks = { "openssl", "lua-http-parser" } }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-hop.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "nvim-telescope/telescope-ui-select.nvim"
  -- use "rcarriga/nvim-notify"
  -- use "AckslD/nvim-neoclip.lua"

  -- Harpoon
  use 'ThePrimeagen/harpoon'

  -- fugitive
  --use 'tpope/vim-fugitive'

  -- Git Worktree
  use 'ThePrimeagen/git-worktree.nvim'

  -- Nvim tree
  use 'kyazdani42/nvim-tree.lua'

  -- Undotree
  use 'mbbill/undotree'

  -- Neovim Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  -- Autopairs
  --use 'jiangmiao/auto-pairs'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- MSC
  --use 'ThePrimeagen/vim-be-good'

  -- Wakatime
  --use 'wakatime/vim-wakatime'

  -- Comments
  use 'numToStr/Comment.nvim'

  -- Dap
  -- use 'mfussenegger/nvim-dap'
  -- use "nvim-telescope/telescope-dap.nvim"

  -- Colorscheme
  use 'mhartington/oceanic-next'
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'
  use "EdenEast/nightfox.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
