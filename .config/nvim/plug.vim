let file = expand('<sfile>:p')
call validate#CheckEnv("NVIM_SHARE_PATH", string(g:file))
call validate#CheckEnv("NVIM_CONFIG_PATH", string(g:file))

" install vim-plug if it's not installed
let data_dir = $NVIM_SHARE_PATH . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" install the plugins in the share path
call plug#begin($NVIM_SHARE_PATH.'/plugged')

" file browsing
source $NVIM_CONFIG_PATH/telescope.vim

" language server
Plug 'neovim/nvim-lspconfig'

" completion
source $NVIM_CONFIG_PATH/completion.vim

call plug#end()

