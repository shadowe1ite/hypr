return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- my plugins
  { 
    "CRAG666/code_runner.nvim",
    lazy = false,
    config = function()
      require "configs.code_runner"
    end,
  },

{
  "CopilotC-Nvim/CopilotChat.nvim",
  lazy = false,
  dependencies = {
    { 
      "github/copilot.vim",
      config = function()
        vim.g.copilot_enabled = true
        vim.g.copilot_no_tab_map = true
      end
    },
    { "nvim-lua/plenary.nvim", branch = "master" },
  },
  build = "make tiktoken",
  event = 'BufWritePre',
  opts = require "configs.copilot",
}

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
