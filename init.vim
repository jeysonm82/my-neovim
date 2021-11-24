" Dependencies
" dnf install python3 node fd-find the-silver-searcher python-autopep8 ripgrep xclip
" pip install neovim
" npm install neovim

let $CONFIG_DIR = $HOME. '/.config/nvim'
" Core configurations
source $CONFIG_DIR/core.vim

" Keymappings 
source $CONFIG_DIR/keymapping.vim

" Plugins
call plug#begin('~/.vim/plugged')

  " Status bar
  Plug 'itchyny/lightline.vim'
  Plug 'kshenoy/vim-signature' " TODO replace with https://github.com/chentau/marks.nvim

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'lewis6991/gitsigns.nvim', {'branch': 'main'}

  " File explorer
  Plug 'kyazdani42/nvim-tree.lua'

  " Icons, UI
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'

  " Colorschemes
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/gruvbox-material'
  Plug 'mhartington/oceanic-next'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'ayu-theme/ayu-vim'
  Plug 'shaeinst/roshnivim-cs', {'branch': 'main'}
  Plug 'norcalli/nvim-colorizer.lua'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'folke/lsp-colors.nvim', {'branch': 'main'}
  Plug 'tami5/lspsaga.nvim', {'branch': 'main'}
  Plug 'simrat39/symbols-outline.nvim'

  " Completion
  Plug 'hrsh7th/cmp-nvim-lsp', {'branch': 'main'}
  Plug 'hrsh7th/cmp-buffer', {'branch': 'main'}
  Plug 'hrsh7th/cmp-path', {'branch': 'main'}
  Plug 'hrsh7th/cmp-cmdline', {'branch': 'main'}
  Plug 'hrsh7th/nvim-cmp', {'branch': 'main'}
  Plug 'hrsh7th/cmp-vsnip', {'branch': 'main'}
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'hrsh7th/cmp-calc', {'branch': 'main'}
  Plug 'tzachar/cmp-tabnine', { 'do': './install.sh',  'branch': 'main' }
  Plug 'onsails/lspkind-nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'tpope/vim-commentary'

  " Snippets
  Plug 'honza/vim-snippets'
  Plug 'michaelb/sniprun', {'do': 'bash install.sh 1'} " needs rust rustup pkgs

  " Python
  Plug 'sbdchd/neoformat'

  " Python Debugger
  Plug 'mfussenegger/nvim-dap'
  Plug 'mfussenegger/nvim-dap-python'
  Plug 'rcarriga/nvim-dap-ui'

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Database
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'kristijanhusak/vim-dadbod-ui'

  " Others
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
  Plug 'psliwka/vim-smoothie'
  Plug 'liuchengxu/vim-which-key'
  Plug 'mhinz/vim-startify'
  Plug 'sheerun/vim-polyglot'
  Plug 'rbgrouleff/bclose.vim'
  Plug 'rcarriga/nvim-notify'

  source $CONFIG_DIR/local.vim
call plug#end()

source $CONFIG_DIR/colorizer.vim
source $CONFIG_DIR/colors.vim
source $CONFIG_DIR/dadbod.vim
source $CONFIG_DIR/dap.vim
source $CONFIG_DIR/lightline.vim
source $CONFIG_DIR/cmp.vim
source $CONFIG_DIR/lsp.vim
source $CONFIG_DIR/neoformat.vim
source $CONFIG_DIR/nvim_tree.vim
source $CONFIG_DIR/signature.vim
source $CONFIG_DIR/gitsigns.vim
source $CONFIG_DIR/sniprun.vim
source $CONFIG_DIR/startify.vim
source $CONFIG_DIR/telescope.vim
source $CONFIG_DIR/treesitter.vim
source $CONFIG_DIR/whichkey.vim
