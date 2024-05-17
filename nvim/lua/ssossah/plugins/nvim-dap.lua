return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "mfussenegger/nvim-dap-python",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        -- note: make sure you have installed debugpy

        local dap = require("dap")
        local dapui = require("dapui")

        local ok, dap = pcall(require, "dap")
        if not ok then
            return
        end

        local path = vim.fn.getcwd() .. "/.env/bin/python"
        require("dap-python").setup(path)

        local q2path = vim.fn.getcwd() .. "/.env/bin/q2"
        table.insert(require("dap").configurations.python, {
            name = "q2 run",
            type = "python",
            request = "launch",
            program = q2path,
            console = "integratedTerminal",
            args = { "run" },
        })

        require("dap-python").test_runner = "pytest"
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
}
