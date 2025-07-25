require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Code Runner keybindings
map("n", "<leader>r", function()
  local bufname = vim.fn.bufname("%")
  if bufname:find("crunner_") then
    vim.cmd("RunClose")
  else
    vim.cmd("RunCode")
  end
end, { desc = "Toggle Code Runner" })
map("n", "<leader>rr", "<cmd>RunFile<cr>", { desc = "Run current file" })
map("n", "<leader>rft", "<cmd>RunFile tab<cr>", { desc = "Run file in new tab" })
--map("n", "<leader>rr", "<cmd>RunProject<cr>", { desc = "Run project" })
--map("n", "<leader>crf", "<cmd>CRFiletype<cr>", { desc = "Choose filetype config" })
--map("n", "<leader>crp", "<cmd>CRProjects<cr>", { desc = "Choose project config" })

-- Copilot 
map("n", "<leader><leader>", "<cmd>CopilotChatToggle<cr>", { desc = "Run current file" })
