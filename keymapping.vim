"--------------------------------
"CORE KEY MAPPINGS

"My leader is space
let mapleader = "\<Space>"

"Enable Ctrl+c Ctrl+v
vmap <C-c> "+yi
vmap <C-x> "+c

"Exit Insert mode using jk instead of ESC (ESC also works but it is not recommended)
imap jk <ESC>
imap kj <ESC>

"Split movements (to move between windows)
map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-q> :q<CR>

"To change current split window size (width and height)
map <A-Up> :res +5<cr>
map <A-Down> :res -5<cr>
map <A-Right> :vertical resize +5<cr>
map <A-Left> :vertical resize -5<cr>

"I save things pressing <TAB> instead of :w <CR>
map <Tab> :wa <cr>

"Disable arrow keys so I can learn the vim way
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

"Toggle Relative Number
nnoremap <leader>n :set relativenumber!<CR>

"Open new tab
nnoremap <leader>t :tabnew <CR>

"--------------------------------
"FIXES
"TODO: can't remember what this does
nnoremap <space><space>  :echoe ""<CR> 

"Stop that stupid window from popping up:
map q: :q

" Fix ESC behavior in terminal buffers
tnoremap <Esc> <C-\><C-n>
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
