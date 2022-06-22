local cmd = vim.cmd
local g = vim.g
local opt = vim.opt

g.mapleader = " "

vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'
  
  -- Languages parser
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Colorscheme
  -- use 'marko-cerovac/material.nvim'
  use 'Mofiqul/vscode.nvim'

end)

-- Tree-sitter config
require'nvim-treesitter.configs'.setup {
  -- Languages to parse 
  ensure_installed = { "lua", "javascript", },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
  },
}

-- vim.g.material_style = "darker"
-- vim.cmd 'colorscheme material'
vim.cmd 'colorscheme vscode'

vim.bo.expandtab = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- basic config
opt.number = true
opt.mouse = 'a'
cmd('set numberwidth=1')
opt.clipboard = 'unnamed'

opt.cursorline = true
g.showmatch = true
cmd('set sw=2')
cmd('set relativenumber')
cmd('set laststatus=2')
