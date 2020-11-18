
" Plugins (uses vim plug)
call plug#begin('~/.vim/plugged')
Plug 'KurtPreston/vimcolors'
Plug 'morhetz/gruvbox' " colors
Plug 'udalov/kotlin-vim' " kotlin syntax
Plug('kshenoy/vim-signature') " Show marks
Plug('HerringtonDarkholme/yats.vim') " Typescript syntax
Plug('itchyny/lightline.vim') " status bar
Plug 'NovaDev94/lightline-onedark'
Plug ('ryanoasis/vim-devicons')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy search inside files (use fd)
Plug ('junegunn/fzf.vim')
Plug('jiangmiao/auto-pairs') " Close pairs
Plug 'francoiscabrol/ranger.vim' " File manager

if !exists('light')
  Plug 'plasticboy/vim-markdown' " markdown syntax
  Plug 'sheerun/vim-polyglot' " syntax
  Plug('pangloss/vim-javascript')
  Plug('tpope/vim-fugitive') " Git integrataion
  Plug('shumphrey/fugitive-gitlab.vim') " Gitlab things
  Plug 'prettier/vim-prettier', { 'do': 'npm install' }
  Plug('Yggdroot/indentLine') " Show indentlines
  Plug('mhinz/vim-signify') " Show git line changes
  Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'} " LSP (tsserver)
  Plug 'puremourning/vimspector' " Debugger (not ready yet :()
"  Plug 'TaDaa/vimade'
else
  echo 'Light nvim version'
endif
call plug#end()

" Themming (colors)
colorscheme gruvbox

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set background=dark
set cursorline " To highlight cursor line
hi VertSplit  guifg=SkyBlue
" Split line colors
au InsertEnter * hi VertSplit  guifg=LawnGreen
au InsertLeave * hi VertSplit  guifg=SkyBlue
set fillchars=vert:┃ " for vsplits
set fillchars+=fold:· " for folds
set cc=0
set nu
" Indent line
let g:indentLine_char = '┊'
let g:indentLine_concealcursor='nc'
" set relativenumber

" Tab behavior
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
"set autoindent
"filetype plugin indent on

" Folding
set foldlevel=10
set foldlevelstart=10
set foldmethod=syntax
set backupcopy=yes

"Explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

"OS clipboard integration
set clipboard+=unnamed

"Signify
let g:signify_sign_add               = '烙'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change            = ''

" Autoload externally changed file
set autoread
au FocusGained * :checktime

" Lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified', 'bufnum' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [ 'filename', 'bufnum' ],
      \             [ 'modified' ] ],
      \   'right': [ [ 'filetype', 'percent' ] ]
      \ },
      \ 'component_function': {
      \  'filetype': 'MyFiletype',
      \  'fileformat': 'MyFileformat',
      \  'fileencoding': 'MyFileformat',
      \  'gitbranch': 'fugitive#head'
      \ },
      \ 'tabline': {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'gitbranch', 'close' ] ]
      \ },
      \ }
set noshowmode

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return ''
  " return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"Automcompletion window
set completeopt=longest,preview,menuone

"FZF 
"command! -bang -nargs=? -complete=dir Files
"  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Fugitive
let g:fugitive_gitlab_domains = ['https://ragitlab2.ra.rockwell.com']

"Feature switches
let g:typescript_indent_disable = 1

"CoC configuration
set cmdheight=1
set updatetime=300
set shortmess+=c
highlight link CocErrorSign GruvboxRed

if !exists('light')
autocmd CursorHold * update
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
endif

" Vim signature
let g:SignatureMarkTextHL = 'Search'

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'

" Key mappings
map <Space> <Leader>
" Enable Ctrl+c Ctrl+v
vmap <C-c> "+yi
vmap <C-x> "+c

" ESC behavior
" Fix ESC behavior in terminal buffers
tnoremap <Esc> <C-\><C-n>
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
"Exit Insert mode using jk instead of ESC
imap jk <ESC><CR>
imap kj <ESC><CR>

"Ranger
" Use <leader>f to start ranger
map <leader>fc :Ranger<CR>

" FZF
map <leader>p :Files<CR>

" Split movements
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-q> :q<CR>
map <leader>o :tab sp<CR>
" Split resize
map <leader>l :vertical resize +5<CR>
map <leader>h :vertical resize -5<CR>
map <leader>j :resize -5<CR>
map <leader>k :resize +5<CR>

" Stop that stupid window from popping up:
map q: :q
nmap <leader>w :w<CR>

" Disable arrow keys
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" Toggle Relative Number
nnoremap <leader>n :set relativenumber!<CR>
map <leader>t  :IndentLinesToggle <CR>
" Fixes bug
nnoremap <space><space>  :echoe ""<CR>

" Toggle vimade
map <leader>vm :VimadeToggle<CR>

" CocList Mapping
" Remap for do codeAction of current line
nmap <leader>ca <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>af  <Plug>(coc-fix-current)
" Show all diagnostics
nnoremap <silent> <leader>di  :<C-u>CocList diagnostics<cr>
"nmap <leader> dip <Plug>(coc-diagnostic-prev)
"nmap <leader> din <Plug>(coc-diagnostic-next)
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Remap for rename current word
nmap <leader>r <Plug>(coc-rename)
nmap <leader>d <Plug>(coc-definition)
nmap <leader>re <Plug>(coc-references)
nmap <leader>i <Plug>(coc-implementation)
"nmap <leader>f  <Plug>(coc-format-selected)
" Autowrite buffers
set autowrite
" CHEATSHEET
" gg=G to format html
" To use registers: "r followed by command or Ctrl + r followd by register in
" command or insert mode
" to use mark use m[mark] or m[MARK], to navigate to local mark use  'm or `m
" to global mark
" fzf: Buffers, Marks and Windows are useful
" :r! command  , to execute command and put output in buffer
" :[range]g/pattern/command
