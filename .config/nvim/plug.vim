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

source $NVIM_CONFIG_PATH/telescope.vim

Plug 'neovim/nvim-lspconfig'

" !google
" internal plugins
" TODO:
" - format file/selection
" - mapping for autocomplete or plugin with window
Plug 'kyazdani42/nvim-web-devicons'
Plug 'sso://user/vintharas/telescope-codesearch.nvim'

call plug#end()

" lua configs that need the above plugins to exist
source $NVIM_CONFIG_PATH/telescope-fzf-native.vim

" !google
source $NVIM_CONFIG_PATH/telescope-codesearch.vim
source $NVIM_CONFIG_PATH/cider-lsp.vim

