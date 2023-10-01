-- note: make sure you have installed debugpy

local ok, dap = pcall(require, "dap")
if not ok then return end

local path = vim.fn.getcwd() .. '/.env/bin/python'
require("nvim-dap-virtual-text").setup()
require('dap-python').setup(path)

local q2path = vim.fn.getcwd() .. '/.env/bin/q2'
table.insert(require('dap').configurations.python, {
  name = 'q2 run',
  type = 'python',
  request = 'launch',
  program = q2path,
  console = "integratedTerminal",
  args = {"run"}
})

require('dap-python').test_runner = 'pytest'
require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    layouts = {
        {
      elements = {
        -- Elements can be strings or table with id and size keys.
        "watches",
        { id = "scopes", size = 0.25 },
        -- "stacks",
        { id = "breakpoints", size = 0.1 },
      },
      size = 55, -- 40 columns
      position = "left",
    },
    {
      elements = {
          {id ="console", size=0.85},
          {id ="repl", size=0.25},
      },
      size = 0.35, -- 25% of total lines
      position = "bottom",
    },
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil, -- Can be integer or nil.
      },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
