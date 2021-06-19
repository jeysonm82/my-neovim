map <leader>p :Files<CR>
map <leader>g :Ag<CR>
"Requirements dnf install the_silver_searcher fd-find
let $FZF_DEFAULT_COMMAND = 'fd --type file --follow --hidden --exclude .git'
