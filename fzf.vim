map <leader>p :Files<CR>
map <leader>g :Ag<CR>

if (exists("fd"))
  "Use fd if available
  let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --color=always  --exclude .git'
endif
