require("bufferline").setup {
    options = {
      numbers = "none",
      diagnostics = "lsp",
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
    },
  }
-- Map keys to switch between windows
vim.api.nvim_set_keymap('n', '<S-f>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-j>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
