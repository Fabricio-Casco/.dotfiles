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
  -- NVIM Optimization
  -- alternative https://github.com/tami5/impatient.nvim
  use 'lewis6991/impatient.nvim'

  -- Packer
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'rust-lang/rust-analyzer'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- Neovim Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Neovim Treesitter
  use ('nvim-treesitter/nvim-treesitter', {
    run = ':TSUpdate'
  })
  use 'nvim-treesitter/playground'

  -- Harpoon
  use 'ThePrimeagen/harpoon'

  -- Colorscheme
  use 'mhartington/oceanic-next'
  use 'gruvbox-community/gruvbox'
  use 'folke/tokyonight.nvim'

  -- Undotree
  use 'mbbill/undotree'

  -- Autopairs
  use 'jiangmiao/auto-pairs'

  -- Statusline
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- MSC
  use 'ThePrimeagen/vim-be-good'

  -- Wakatime
  use 'wakatime/vim-wakatime'

  -- Nvim tree
  use 'kyazdani42/nvim-tree.lua'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
