vim.g.minimap_cursor_color = 'MinimapCursor'
vim.g.minimap_range_color = 'MinimapRange'
vim.g.minimap_base_highlight = 'MinimapBase'
vim.g.minimap_highlight = 'MinimapCurrentLine'
vim.cmd([[
  hi MinimapBase ctermfg=8 ctermbg=NONE
  hi MinimapCurrentLine ctermfg=1 ctermbg=3
  hi minimapCursor ctermfg=NONE ctermbg=red
  hi minimapRange ctermfg=8 ctermbg=NONE
]])

vim.g.minimap_enable_highlight_colorgroup = 0
vim.g.minimap_width = 6
vim.g.minimap_auto_start_win_enter = 1
vim.g.minimap_highlight_range = 1
vim.g.minimap_highlight = "minimapCurrent"

vim.keymap.set("n","<S-M>", ":MinimapToggle<CR>")
