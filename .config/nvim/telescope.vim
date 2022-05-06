Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" !google
" Plug 'nvim-telescope/telescope.nvim'
" use 0.6 tag as 0.7 is not in google. google telescope plugin requires
Plug 'nvim-telescope/telescope.nvim', { 'tag': 'nvim-0.6' }

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
