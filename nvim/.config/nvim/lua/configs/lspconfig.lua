require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "gopls" }
vim.lsp.enable(servers)
