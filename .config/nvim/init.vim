let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))
call validate#CheckEnv("HOME", string(g:file))

let &runtimepath .= ','.expand($NVIM_CONFIG_PATH."/autoload")
let &packpath = &runtimepath

" !google
source $NVIM_CONFIG_PATH/google.vim

" personal preferences
source $NVIM_CONFIG_PATH/mappings.vim
source $NVIM_CONFIG_PATH/editor.vim

" plugins
source $NVIM_CONFIG_PATH/plug.vim

" lua configs that must run after Plug:
" !google
source $NVIM_CONFIG_PATH/telescope-codesearch.vim
source $NVIM_CONFIG_PATH/cider-lsp.vim

" telescope finder
source $NVIM_CONFIG_PATH/telescope-fzf-native.vim

