-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	-- This pkg auto closes brackets, braces, etc upon <CR>
  use 'rstacruz/vim-closer'

	-- nvim-tree: file explorer etc
	use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', opt =  false 
  	},
	}

	-- theme
	use 'almo7aya/neogruvbox.nvim'
	
	-- toggle terminal!
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
	  require("toggleterm").setup{
			open_mapping = [[<c-\>]],
			}
	end}

	-- TreeSitter highlighting !
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
  }

	-- bufferline (tab bar)
	use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
	-- // -- tab bar 
	-- // use 'romgrk/barbar.nvim'

	-- telescope
	use {'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim'}
	-- better digraphs (symbols e.g. sigma, integral)
	use 'protex/better-digraphs.nvim' 

	-- coq completion
	use 'ms-jpq/coq_nvim'
	use 'ms-jpq/coq.artifacts'

	-- lspconfig
	use 'neovim/nvim-lspconfig'

	-- Markdown previewer!
	use({
	    "iamcco/markdown-preview.nvim",
	    run = function() vim.fn["mkdp#util#install"]() end,
	})

end)
