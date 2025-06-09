require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "gopls", "tsserver" }

local lspconfig = require("lspconfig")
lspconfig.qmlls.setup({
  cmd = { "qmlls6" }, -- Path to your installed QML language server
  filetypes = { "qml" },
  root_dir = lspconfig.util.root_pattern(".git", "*.qml")
})

vim.lsp.enable(servers)
