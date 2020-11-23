"--------------------------------
"CORE CONFIGURATIONS
colorscheme desert

" Set relative number column
set nu
set rnu

" Autowrite buffers
set autowrite

"Colors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark

"To highlight cursor line
set cursorline

"UI decorations
hi VertSplit  guifg=SkyBlue
au InsertEnter * hi VertSplit  guifg=LawnGreen
au InsertLeave * hi VertSplit  guifg=SkyBlue
set fillchars=vert:┃ " for vsplits
set fillchars+=fold:· " for folds
set cc=0
let g:indentLine_char = '┊'
set noshowmode
set showtabline=2

"Tab behavior
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab

"Folding
set foldlevel=10
set foldlevelstart=10
set foldmethod=syntax
set backupcopy=yes

"OS clipboard integration
set clipboard+=unnamedplus

" Autoload externally changed file
set autoread
au FocusGained * :checktime

"Automcompletion window
set completeopt=longest,preview,menuone

"Folding
au BufNewFile,BufRead *.py set foldmethod=indent
