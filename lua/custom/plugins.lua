local cmp = require "custom.configs.cmp"
local gitsigns = require "custom.configs.gitsigns"
local glow = require "custom.configs.glow"
local mason = require "custom.configs.mason"
local nvimtree = require "custom.configs.nvimtree"
local nvterm = require "custom.configs.nvterm"
local treesitter = require "custom.configs.treesitter"

---@type NvPluginSpec[]
local plugins = {
  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "zbirenbaum/copilot.lua",
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = cmp.opts,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = gitsigns.opts,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings "dap_go"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "ellisonleao/glow.nvim",
    config = true,
    cmd = "Glow",
    opts = glow.opts,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = mason.opts,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {
      "bash",
      "c",
      "cpp",
      "css",
      "go",
      "html",
      "lua",
      "markdown",
      "python",
      "ruby",
      "scss",
      "sh",
      "terraform",
      "typescriptreact",
      "yaml",
      "zsh",
    },
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "NvChad/nvterm",
    opts = nvterm.opts,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = nvimtree.opts,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = treesitter.opts,
  },
}

return plugins
