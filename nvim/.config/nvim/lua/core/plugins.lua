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
    use 'wbthomason/packer.nvim'
  -- My plugins here
  -- Themes
    use {'ray-x/aurora'}
    use {'ellisonleao/gruvbox.nvim'}
    use {'navarasu/onedark.nvim'}
    use { "catppuccin/nvim", as = "catppuccin" }
    use {'xiyaowong/transparent.nvim'}
  --end
    use {'ap/vim-css-color'}
    use {'junegunn/fzf.vim'}
    use {
  'Fymyte/rasi.vim',
  ft = 'rasi',
}
    use {'simrat39/rust-tools.nvim'}
    use {'nvim-tree/nvim-tree.lua'}
    use {'mhinz/vim-startify'}
    use {'ryanoasis/vim-devicons'}
    use {'kyazdani42/nvim-web-devicons'}
    use {'vim-syntastic/syntastic'}
    use {'nvim-lualine/lualine.nvim'}
    use {'audibleblink/hackthebox.vim'}
    use {'seandewar/killersheep.nvim'}
    use {'lukas-reineke/indent-blankline.nvim'}
    use {'karb94/neoscroll.nvim'}
    use {'lewis6991/spellsitter.nvim'}
    use {'rcarriga/nvim-notify'}
    use {'3rd/image.nvim'}
    --web
    use {
	    'turbio/bracey.vim',
	    run = 'cd ~/.local/share/nvim/site/pack/packer/start/bracey.vim && npm install --prefix server'
    }
    use {'alvan/vim-closetag'}
    use {'ray-x/web-tools.nvim'}
    use {'mattn/emmet-vim'}
    use {'nvim-treesitter/nvim-treesitter'}
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    use {'wfxr/minimap.vim'}
    use{'jose-elias-alvarez/null-ls.nvim'}
    use{'MunifTanjim/prettier.nvim'}
    -- Mason.nvim
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'github/copilot.vim'}
    
    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-path'}
    use {'lukas-reineke/cmp-under-comparator'}
    use {'elkowar/yuck.vim'}
    -- use {'VonHeikemen/lsp-zero.nvim'}
    use {'L3MON4D3/LuaSnip'}
    use {'saadparwaiz1/cmp_luasnip'}
   -- use {'rafamadriz/friendly-snippets'}
    use { "ray-x/lsp_signature.nvim" }
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    --Telescope
    use {'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }

    -- Markdown Preview
-- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	    require("toggleterm").setup()
    end}
    -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
