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
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
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
" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"Automcompletion window
set completeopt=longest,preview,menuone

"Folding
au BufNewFile,BufRead *.py set foldmethod=indent

set wrap
