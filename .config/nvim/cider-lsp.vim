set completeopt=menu,menuone,noselect

lua << EOF
-- set up cmp
-- TODO: separate this config into some files in nvim/lua/init.lua
-- one for cmp
-- anotherone for cider-lsp
local cmp = require('cmp')

cmp.setup({
  snippet = {
    -- REQUIRED - must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.ciderlsp then
configs.ciderlsp = {
  default_config = {
    cmd = {
 					 '/google/bin/releases/cider/ciderlsp/ciderlsp',
 	         '--tooltag=nvim-lsp',
 					 '--noforward_sync_responses'
    };
    filetypes = {
      'c', 'cpp', 'java', 'proto', 'textproto', 'go', 'python', 'bzl',
      'typescript',
      -- NOTE: javascript is not supported, but some features do work because
      --       of the way typescript support is implemented.
      'javascript'
    };
    root_dir = require('lspconfig').util.root_pattern('BUILD');
    settings = {};
  }
}
end


-- Setup CiderLSP.
-- TODO: move this to a different lua file
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
				 if k ~= 'util' then
           if type(k) ~= 'number' then k = '"'..k..'"' end
           s = s .. '['..k..'] = ' .. dump(v) .. ','
				 end
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
-- print(dump(require('lspconfig')))
-- print(dump(require('lspconfig').ciderlsp))

require('lspconfig').ciderlsp.setup { 
  on_attach = function(client, bufnr)
    -- Omni-completion via LSP. See `:help compl-omni`. Use <C-x><C-o> in
    -- insert mode. Or use an external autocompleter (see below) for a
    -- smoother UX.
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    if vim.lsp.formatexpr then -- Neovim v0.6.0+ only.
      vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr")
    end
    if vim.lsp.tagfunc then -- Neovim v0.6.0+ only.
      -- Tag functionality via LSP. See `:help tag-commands`. Use <c-]> to
      -- go-to-definition.
      vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    local opts = { noremap = true, silent = true }
    -- See `:help vim.lsp.*` for documentation on any of the below functions.
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K",  "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

		-- configured in telescope.vim as they are lsp-independent
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

    vim.api.nvim_command("augroup LSP")
    vim.api.nvim_command("autocmd!")
    if client.server_capabilities.document_highlight then
      vim.api.nvim_command("autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()")
      vim.api.nvim_command("autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()")
      vim.api.nvim_command("autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()")
    end
    vim.api.nvim_command("augroup END")
  end,
  capabilities = capabilities
}

EOF
