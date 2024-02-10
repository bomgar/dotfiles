return {

    -- showing keybindings
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            local which_key = require("which-key")
            which_key.setup({})
            which_key.register({
                f = {
                    name = "+find",
                    s = {
                        function()
                            require("telescope.builtin").grep_string()
                        end,
                        "Grep word under cursor",
                    },
                },
            }, { prefix = "<leader>", mode = "v" })
            which_key.register({
                e = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
                d = {
                    name = "diffview",
                    o = { "<cmd>DiffviewOpen<CR>", "open" },
                    c = { "<cmd>DiffviewClose<CR>", "close" },
                    h = { "<cmd>DiffviewFileHistory<CR>", "history" },
                    f = { "<cmd>DiffviewFileHistory %<CR>", "file history" },
                },
                q = {
                    name = "quickfix",
                    o = { "<cmd>copen<CR>", "open" },
                    c = { "<cmd>cclose<CR>", "close" },
                    n = { "<cmd>cnext<CR>", "next" },
                    p = { "<cmd>cprevious", "previous" },
                },
                b = {
                    name = "debug",
                    c = {
                        function()
                            require("dap").continue()
                        end,
                        "continue",
                    },
                    o = {
                        function()
                            require("dap").step_over()
                        end,
                        "step over",
                    },
                    i = {
                        function()
                            require("dap").step_into()
                        end,
                        "step into",
                    },
                    e = {
                        function()
                            require("dap").step_out()
                        end,
                        "step out",
                    },
                    b = {
                        function()
                            require("dap").toggle_breakpoint()
                        end,
                        "toggle breakpoint",
                    },
                },
                f = {
                    name = "+find",
                    f = {
                        function()
                            require("telescope.builtin").find_files()
                        end,
                        "Find File",
                    },
                    s = {
                        function()
                            require("telescope.builtin").grep_string()
                        end,
                        "Grep word under cursor",
                    },
                    ["."] = {
                        function()
                            require("telescope.builtin").find_files({ hidden = true })
                        end,
                        "Find hidden files",
                    },
                    c = {
                        function()
                            require("telescope.builtin").command_history()
                        end,
                        "command history",
                    },
                    a = {
                        function()
                            require("telescope.builtin").builtin()
                        end,
                        "all pickers",
                    },
                    g = {
                        function()
                            require("telescope.builtin").live_grep()
                        end,
                        "Live Grep",
                    },
                    b = {
                        function()
                            require("telescope.builtin").buffers()
                        end,
                        "Buffers",
                    },
                    ["?"] = {
                        function()
                            require("telescope.builtin").help_tags()
                        end,
                        "Help Tags",
                    },
                    r = { "<cmd>Telescope rage<CR>", "Rage" },
                    m = {
                        function()
                            require("telescope.builtin").marks()
                        end,
                        "Marks",
                    },
                    j = {
                        function()
                            require("telescope.builtin").jumplist()
                        end,
                        "Jumplist",
                    },
                    q = {
                        function()
                            require("telescope.builtin").quickfix()
                        end,
                        "quickfix",
                    },
                },
                c = {
                    name = "text-case",
                    t = { "<cmd>TextCaseOpenTelescope<CR>", "Telescope" },
                },
                x = {
                    name = "inspect", -- Group name
                    t = {
                        function()
                            require("trouble").toggle()
                        end,
                        "Toggle trouble",
                    },
                },
                t = {
                    name = "+test",
                    r = {
                        function()
                            require("neotest").run.run()
                        end,
                        "Run test",
                    },
                    d = {
                        function()
                            require("neotest").run.run({ strategy = "dap" })
                        end,
                        "Debug test",
                    },
                    g = {
                        function()
                            require("dap-go").debug_test()
                        end,
                        "Debug go test",
                    },
                    f = {
                        function()
                            require("neotest").run.run(vim.fn.expand("%"))
                        end,
                        "Run current file",
                    },
                    p = { "<cmd>Neotest output-panel<CR>", "Output panel" },
                    o = { "<cmd>Neotest output<CR>", "Output" },
                    s = { "<cmd>Neotest summary<CR>", "summary" },
                },
            }, { prefix = "<leader>" })
        end,
    },
}
