let g:mapleader = ","

" remap escape
inoremap jk <ESC>
tnoremap jk <C-\><C-n>

" remove highlight
nnoremap <Leader>n :noh<CR>
" open vimconfig
nnoremap <leader>v :edit $MYVIMRC<CR>
" view directory of currently-edited file
nnoremap <Leader>ls :edit %:p:h<CR>
" source current file
nnoremap <Leader>so :so %<CR>

nnoremap ; :
nnoremap : ;
nnoremap <silent> <Leader>w <Esc>:w<CR>
nnoremap <silent> <Leader>e <Esc>:noa w<CR>
nnoremap <silent> <Leader>q <Esc>:q<CR>

" nnoremap <Leader>T :tabnew<Space>+term<Space>\|<Space>tabm<Space>0<Cr>
