-- Startify plugin
vim.api.nvim_set_keymap('n', '<C-i>', ':Startify<CR>', { noremap = true })

-- toggle line numbers
vim.api.nvim_set_keymap('n', '<C-n>', ':set number!<CR>', { noremap = true })


-- auto code running
vim.api.nvim_exec([[
augroup exe_code

	autocmd!
	" exe python
	autocmd FileType python nnoremap <buffer> <localleader>r
				\ :sp<CR>:term python3 %<CR>:startinsert<CR>
	" exe bash
	autocmd FileType bash,sh nnoremap <buffer> <localleader>r
				\ :sp<CR>:term bash %<CR>:startinsert<CR>
	" C/C++
	autocmd FileType c,cpp nnoremap <buffer> <localleader>r
				\ :sp<CR>:term gcc %:p && ./a.out && rm a.out<CR>:startinsert<CR>

augroup END
]], false)


