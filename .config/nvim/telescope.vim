Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" telescope into lsp
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gW <cmd>Telescope lsp_workspace_symbol<cr>
nnoremap g0 <cmd>Telescope lsp_document_symbol<cr>

