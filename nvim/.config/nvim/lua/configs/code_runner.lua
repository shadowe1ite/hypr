-- this is a config example
require('code_runner').setup {
  filetype_path = vim.fn.expand('~/.config/nvim/lua/configs/code_runner/code_runner.json'),
  project_path = vim.fn.expand('~/.config/nvim/lua/configs/code_runner/project_manager.json')
}

vim.keymap.set('n', '<leader>r', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
