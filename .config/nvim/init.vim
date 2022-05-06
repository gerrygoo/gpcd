let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))
call validate#CheckEnv("HOME", string(g:file))

let &runtimepath .= ','.expand($NVIM_CONFIG_PATH."/autoload")
let &packpath = &runtimepath

source $NVIM_CONFIG_PATH/mappings.vim
source $NVIM_CONFIG_PATH/editor.vim

source $NVIM_CONFIG_PATH/plug.vim

" !google
" google-specific plugins
source $NVIM_CONFIG_PATH/google.vim
