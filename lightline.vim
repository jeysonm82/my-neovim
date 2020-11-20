let g:lightline = {
      \ 'colorscheme': 'sonokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified', 'bufnum' ] ],
      \   'right': [ ['lineinfo' ],
      \               ['percent'],
      \              [ 'fileencoding', 'filetype']] 
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
      \  'time': 'MyTime',
      \  'gitbranch': 'fugitive#head'
      \ },
      \ 'tabline': {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'gitbranch', 'close' ] ]
      \ },
      "\ 'tabline_separator': { 'left': '', 'right': '' },
      \ 'tabline_separator': { 'left': '▒', 'right': '▒' },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyTime()
  return winwidth(0) > 70 ? strftime('%T') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
