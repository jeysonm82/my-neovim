let g:mapleader = "\<Space>"
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

set timeoutlen=200
let g:which_key_map =  {}
"let g:which_key_map['ca'] = 'LSP Code actions'
"let g:which_key_map.d = 'LSP Definitions'
call which_key#register('<Space>', "g:which_key_map")
