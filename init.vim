" Dependencies
" dnf install python3 node ranger highlight fd-find the-silver-searcher python-autopep8 ripgrep xclip
" pip install neovim
" npm install neovim

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
  Plug 'francoiscabrol/ranger.vim'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'windwp/nvim-autopairs'
  Plug 'hrsh7th/nvim-compe'
  Plug 'tzachar/compe-tabnine', { 'do': './install.sh',  'branch': 'main' }
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'

  " Colorschemes
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/gruvbox-material'
  Plug 'mhartington/oceanic-next'
  Plug 'norcalli/nvim-colorizer.lua'

  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim', {'branch': 'main'}
  Plug 'liuchengxu/vista.vim'
  Plug 'honza/vim-snippets'
  Plug 'liuchengxu/vim-which-key'
  Plug 'mhinz/vim-startify'
  Plug 'metakirby5/codi.vim'
  Plug 'sbdchd/neoformat'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  " Debugger
  Plug 'mfussenegger/nvim-dap'
  Plug 'mfussenegger/nvim-dap-python'
  source $CONFIG_DIR/local.vim
call plug#end()

source $CONFIG_DIR/colors.vim
source $CONFIG_DIR/lightline.vim
source $CONFIG_DIR/signature.vim
source $CONFIG_DIR/ranger.vim
source $CONFIG_DIR/signify.vim
source $CONFIG_DIR/coc.vim
source $CONFIG_DIR/colorizer.vim
source $CONFIG_DIR/neoformat.vim
source $CONFIG_DIR/whichkey.vim
source $CONFIG_DIR/startify.vim
source $CONFIG_DIR/codi.vim
source $CONFIG_DIR/dap.vim
source $CONFIG_DIR/lsp.vim
source $CONFIG_DIR/telescope.vim
