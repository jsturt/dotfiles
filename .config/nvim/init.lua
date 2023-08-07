-- ::: init.lua ::: -- 

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- init.vim commands
vim.cmd("set nowrap")
vim.cmd("set number")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set foldmethod=marker")

-- disable ctrl-z suspension
vim.api.nvim_set_keymap('n','<c-z>','<nop>',{noremap = true})

-- enable cursor line highlighting
vim.o.cursorline = true 

-- enable plugins
require("plugins")

-- theme
vim.cmd("colorscheme neogruvbox")

-- digraph mapping
vim.api.nvim_set_keymap('i','<c-k><c-k>','<Cmd>lua require"better-digraphs".digraphs("insert")<CR>',{noremap = true})
vim.api.nvim_set_keymap('n','r<c-k><c-k>','<Cmd>lua require"better-digraphs".digraphs("normal")<CR>',{noremap = true})
vim.api.nvim_set_keymap('v','r<c-k><c-k>','<ESC><Cmd>lua require"better-digraphs".digraphs("visual")<CR>',{noremap = true})

-- treesitter
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true
	}
}

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- enable bufferline
local bufferline = require("bufferline")
bufferline.setup({
	options = {	
		separator_style = "slant"
	}
})

-- NvimTree
-- empty setup using defaults
require("nvim-tree").setup()
vim.cmd("NvimTreeOpen")
-- keymap for toggle NvimTree
vim.api.nvim_set_keymap('i', '<c-n>', '<Cmd>NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<c-n>', '<Cmd>NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<c-n>', '<Cmd>NvimTreeToggle<CR>', {noremap = true})

-- init coq
require("coq")
vim.cmd("COQnow")

-- init lspconfig
local lspconfig = require'lspconfig'

-- init ccls 
-- require'lspconfig'.ccls.setup{}
lspconfig.ccls.setup{
	init_options = {
		compilationDatabaseDirectory = "builddir";
	};
}

-- init pylsp
lspconfig.pylsp.setup {}

