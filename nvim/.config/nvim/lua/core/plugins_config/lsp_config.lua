require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "pyright", "clangd", "html", "cssls", "jsonls", "bashls", "tsserver", "asm_lsp"} })

local on_attach = function(_, _)
	vim.keymap('n', '<leader>rn', vim.lsp.buf.rename, {}) 
	vim.keymap('n', '<leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap('n', 'gi', vim.lsp.buf.implementation, {})
	vim.keymap('n', 'gr', require('telescope.builtin').lsp_references, {})
	vim.keymap('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}


local lspconfig = require("lspconfig")

local servers = {
  "pyright",
  "clangd",
  "asm_lsp",
  "bashls",
  "html",
  "cssls",
  "jsonls",
  "tsserver",
  "asm_lsp"
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end
