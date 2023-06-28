require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "pyright", "clangd", "html", "cssls", "jsonls", "bashls", "tsserver", "asm_lsp", "rust_analyzer" } })

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
--  "html",
  "cssls",
  "jsonls",
  "tsserver",
  "asm_lsp",
  "rust_analyzer"
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end

local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(opts)

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
