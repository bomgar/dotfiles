return {
    {
        "mfussenegger/nvim-dap",
        enabled = not vim.g.vscode,
        dependencies = {
            "williamboman/mason.nvim",
            {
                "leoluz/nvim-dap-go",
                config = true,
            },
            "rcarriga/nvim-dap-ui",
            "jay-babu/mason-nvim-dap.nvim",
        },
        keys = {

            { "<leader>bc", function() require("dap").continue() end,          desc = "continue" },
            { "<leader>bo", function() require("dap").step_over() end,         desc = "step over" },
            { "<leader>bi", function() require("dap").step_into() end,         desc = "step into" },
            { "<leader>be", function() require("dap").step_out() end,          desc = "step out" },
            { "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "codelldb",
                    "delve",
                },
                handlers = {}, -- sets up dap in the predefined manner
            })

            local dap, dapui = require("dap"), require("dapui")
            dapui.setup({})
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
}
