" Coc extentions
let g:coc_global_extensions = ['coc-pyright', 'coc-json', 'coc-snippets', 'coc-explorer', 'coc-tabnine', 'coc-tsserver', 'coc-prettier', 'coc-eslint', 'coc-css']
" Coc Mapping
" Remap for do codeAction of current line
nmap <leader>lc <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>lz  <Plug>(coc-fix-current)
" Show all diagnostics
nnoremap <silent> <leader>lq  :<C-u>CocList diagnostics<cr>
"nmap <leader> ldip <Plug>(coc-diagnostic-prev)
"nmap <leader> ldin <Plug>(coc-diagnostic-next)
" Search workspace symbols
nnoremap <silent> <leader>ls  :<C-u>CocList -I symbols<cr>
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>le <Plug>(coc-references)
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>li <Plug>(coc-implementation)
command! -nargs=0 Format :call CocAction('format')
nmap <leader>lf :Format<cr>
"nmap <leader>f  <Plug>(coc-format-selected)
nnoremap <leader> lk :call <SID>show_documentation()<CR>
nmap <leader>e :CocCommand explorer<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
