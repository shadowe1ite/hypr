-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

local theme = "meterial"
local theme_path = vim.fn.stdpath("data") .. "/lazy/base46/lua/base46/themes/" .. theme .. ".lua"

if vim.fn.filereadable(theme_path) ~= 1 then
  os.execute("waypaper --restore >/dev/null 2>&1")
end

M.base46 = { 
  theme = theme 
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
