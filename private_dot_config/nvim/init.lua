vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.encoding = "utf-8"

vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.compatible = false
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.belloff = "all"
vim.opt.errorbells = false
vim.opt.virtualedit = "block"
vim.opt.swapfile = false
vim.opt.list = true
vim.opt.showcmd = true
vim.opt.mouse = "a"
vim.opt.incsearch = true
vim.opt.listchars = { space = "·", tab = "▸ " }
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.signcolumn = "yes"

vim.g.rainbow_active = true
vim.g.airline_powerline_fonts = true

local keyset = vim.keymap.set

keyset('n', '<C-s-L>', ':nohlsearch<CR><C-L>')

keyset('n', '<C-h>', '<C-w>h')
keyset('n', '<C-j>', '<C-w>j')
keyset('n', '<C-k>', '<C-w>k')
keyset('n', '<C-l>', '<C-w>l')

keyset('n', 'Y', 'y$')

keyset('n', '<leader>p', ':Files .<CR>', { silent = true })
keyset('n', '<leader>b', ':Buffers<CR>', { silent = true })

local fzf_colors = {
  fg      = {'fg', 'GruvboxFg1'},
  bg      = {'fg', 'GruvboxBg0'},
  hl      = {'fg', 'GruvboxRed'},
  ['fg+'] = {'fg', 'GruvboxGreen'},
  ['bg+'] = {'fg', 'GruvboxBg1'},
  ['hl+'] = {'fg', 'GruvboxRed'},
  info    = {'fg', 'GruvboxOrange'},
  -- border  = {'fg', 'GruvboxBg0'},
  prompt  = {'fg', 'GruvboxAqua'},
  pointer = {'fg', 'GruvboxOrange'},
  marker  = {'fg', 'GruvboxYellow'},
  spinner = {'fg', 'GruvboxGreen'},
  header  = {'fg', 'GruvboxBlue'},
}

vim.g.fzf_colors = fzf_colors

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "neoclide/coc.nvim", branch = "master", build = "npm ci" },
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "junegunn/fzf" },
  { "junegunn/fzf.vim" },
  { "airblade/vim-gitgutter" },
  { "kaarmu/typst.vim", ft = "typst" },
  { "mphe/vim-gdscript4", ft = "gdscript" },
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
})

require("coc")

vim.opt.background = "dark"
vim.cmd([[colorscheme gruvbox]])

require('lualine').setup()
