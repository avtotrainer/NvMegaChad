---@type MappingsTable
local M = {}

-- Disabled NvChad core mappings

M.disabled = {
  i = {
    ["<C-b>"] = "",
    ["<C-e>"] = "",
  },

  t = {
    ["<C-x>"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v>"] = "",
  },

  v = {
    ["<Up>"] = "",
    ["<Down>"] = "",
  },

  n = {
    ["<C-s>"] = "",
    ["<Up>"] = "",
    ["<Down>"] = "",
    ["<leader>fh"] = "",
    ["<leader>th"] = "",
    ["<leader>ma"] = "",
    ["<leader>fo"] = "",
    ["<leadr>fz"] = "",
    ["<A-i>"] = "",
    ["<A-h>"] = "",
    ["<A-v"] = "",
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
    ["<leader>cc"] = "",
    ["]c"] = "",
    ["[c"] = "",
    ["<leader>rh"] = "",
    ["<leader>ph"] = "",
    ["<leader>gb"] = "",
    ["<leader>td"] = "",
    ["<leader>fm"] = "",
  },
}

M.general = {
  n = {
    ["<S-u>"] = { "<C-r>", "Redo" },
    ["<C-d>"] = { "<C-d>zz", "Move half page down", opts = { noremap = true } },
    ["<C-u>"] = { "<C-u>zz", "Move half page up", opts = { noremap = true } },
    ["<C-f>"] = { "<C-f>zz", "Move one page down", opts = { noremap = true } },
    ["<C-b>"] = { "<C-b>zz", "Move one page up", opts = { noremap = true } },
    ["<leader>s"] = { "<cmd> w <CR>", "Save file" },
    ["<leader>lu"] = { "<cmd> Lazy update <CR>", "Update plugins" },
    ["<leader>pr"] = { "<cmd> Glow <CR>", "Preview Markdown file" },
    ["<leader>fmt"] = {
      function()
        vim.g.format_on_save = not vim.g.format_on_save
        if vim.g.format_on_save then
          print "Format on save enabled"
        else
          print "Format on save disabled"
        end
      end,
      "Toggle format on save",
    },
    ["<leader>cp"] = {
      function()
        if vim.g.copilot_enabled then
          vim.cmd "Copilot disable"
          print "Copilot disabled"
        else
          vim.cmd "Copilot enable"
          print "Copilot enabled"
        end
        vim.g.copilot_enabled = not vim.g.copilot_enabled
      end,
      "Toggle Copilot",
    },
  },
  t = {
    ["<ESC>"] = { "<C-\\><C-n>", "Escape terminal mode", opts = { nowait = true } },
    ["jk"] = { "<C-\\><C-n>", "Escape terminal mode", opts = { nowait = true } },
  },
  i = {
    ["jk"] = { "<ESC>", "Escape insert mode", opts = { nowait = true } },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dso"] = {
      "<cmd> DapStepOver <CR>",
      "Step Over",
    },
    ["<leader>dsi"] = {
      "<cmd> DapStepIn <CR>",
      "Step In",
    },
    ["<leader>dc"] = {
      "<cmd> DapContinue <CR>",
      "Continue",
    },
    ["<leader>dt"] = {
      "<cmd> DapTerminate <CR>",
      "Terminate",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dtg"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug Go test",
    },
    ["<leader>dtl"] = {
      function()
        require("dap-go").debug_last_test()
      end,
      "Debug last Go test",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dtp"] = {
      function()
        require("dap-python").test_method()
      end,
      "Debug Python test",
    },
  },
}

return M
