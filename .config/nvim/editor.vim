" enable syntax highlighting
syntax on

" show hidden files in file browser
set hidden

" set the current line number, set relative line numbers, set number width
set nu rnu nuw=2

" colorscheme
colo slate
hi Normal guibg=NONE ctermbg=NONE

" enable scroll and clicking around with the mouse
set mouse=a

" draw a column at column 80
set colorcolumn=81

" TODO: understand vim tab management and customize it.
" i'm not sure if this works. i've never understood vim tab management.
set tabstop=2

" don't resize buff splits automatically
set noequalalways

" fix brace matching highlihgt
hi MatchParen ctermbg=NONE ctermfg=lightblue
