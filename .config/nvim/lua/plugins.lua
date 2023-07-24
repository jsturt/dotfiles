-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Edits I've made (commented out parts) are done with "-- //"

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
	use {'ms-jpq/coq_nvim'}
	use {'ms-jpq/coq.artifacts'}

	-- lspconfig
	use {'neovim/nvim-lspconfig'}


  -- Load on a combination of conditions: specific filetypes or commands
  -- Also run code after load (see the "config" key)
  -- // use {
  -- //   'w0rp/ale',
  -- //   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  -- //   cmd = 'ALEEnable',
  -- //   config = 'vim.cmd[[ALEEnable]]'
  -- // }

  -- Plugins can have dependencies on other plugins
	-- Auto-Complete suggestions which integrates with nvims lsp
  -- // use {
  -- //   'haorenW1025/completion-nvim',
  -- //   opt = true,
  -- //   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- // }


  -- Plugins can have post-install/update hooks
	-- Markdown previewer! sounds very cool
  --use {'iamcco/markdown-preview.nvim', cmd = 'MarkdownPreview'}
  --use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
	-- install without yarn or npm
	use({
	    "iamcco/markdown-preview.nvim",
	    run = function() vim.fn["mkdp#util#install"]() end,
	})

end)
