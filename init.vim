" Dependencies
" python3 node ranger highlight fd
" neovim for python3

let $CONFIG_DIR = $HOME. '/.config/nvim'
" Core configurations
source $CONFIG_DIR/core.vim

" Keymappings 
source $CONFIG_DIR/keymapping.vim

" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'kshenoy/vim-signature'
  Plug 'itchyny/lightline.vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSInstall python typescript html json javascript css' }

  " Colorschemes
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/gruvbox-material'
  Plug 'mhartington/oceanic-next'

  Plug 'norcalli/nvim-colorizer.lua'
  "Plug 'lukas-reineke/indent-blankline.nvim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'liuchengxu/vista.vim'
  Plug 'honza/vim-snippets'
  Plug 'liuchengxu/vim-which-key'
  Plug 'mhinz/vim-startify'
  Plug 'metakirby5/codi.vim'
  " Debugger
  Plug 'mfussenegger/nvim-dap'
  Plug 'mfussenegger/nvim-dap-python'
call plug#end()

source $CONFIG_DIR/colors.vim
source $CONFIG_DIR/lightline.vim
source $CONFIG_DIR/signature.vim
source $CONFIG_DIR/fzf.vim
source $CONFIG_DIR/ranger.vim
source $CONFIG_DIR/signify.vim
source $CONFIG_DIR/coc.vim
source $CONFIG_DIR/treesitter.vim
source $CONFIG_DIR/colorizer.vim
source $CONFIG_DIR/neoformat.vim
source $CONFIG_DIR/whichkey.vim
source $CONFIG_DIR/startify.vim
source $CONFIG_DIR/codi.vim
source $CONFIG_DIR/dap.vim
