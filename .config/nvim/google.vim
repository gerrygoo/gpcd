source /usr/share/vim/google/glug/bootstrap.vim

Glug google
Glug codefmt plugin[mappings] gofmt_executable="goimports"
Glug codefmt-google
Glug googlestyle blacklist=`['/usr']`
Glug relatedfiles plugin[mappings]
Glug piper plugin[mappings]

let g:piperlib_ignored_dirs = ['/usr', '/home', '/etc/', '/opt']
let g:google_coding_style_whitelist = ['.*']

if &diff
  command W w
else
  command -bar F silent exec "!hg fixwdir"
  command W w | F | e | redraw! 
  command WA wa | F | windo e | redraw!
endif

" TODO: get cool snippets
" inoremap <Leader>a <C-x><C-o>


" TODO: read my google vimwiki
