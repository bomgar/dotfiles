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
            which_key.add({
                mode = {"v"},
                {"<leader>f", group = "find"},
                {"<leader>fs", function() require("telescope.builtin").grep_string() end, desc = "Grep word under cursor"}
            })
            which_key.add({
                {"<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree"},
                {"<leader>d", group = "diffview"},
                {"<leader>do", "<cmd>DiffviewOpen<CR>", desc = "open"},
                {"<leader>dc", "<cmd>DiffviewClose<CR>", desc = "close"},
                {"<leader>dh", "<cmd>DiffviewFileHistory<CR>", desc = "history"},
                {"<leader>df", "<cmd>DiffviewFileHistory %<CR>", desc = "file history"},
                {"<leader>q", group = "quickfix"},
                {"<leader>qo", "<cmd>copen<CR>", desc = "open"},
                {"<leader>qc", "<cmd>cclose<CR>", desc = "close"},
                {"<leader>qn", "<cmd>cnext<CR>", desc = "next"},
                {"<leader>qp", "<cmd>cprevious", desc = "previous"},
                {"<leader>b", group = "debug"},
                {"<leader>bc", function() require("dap").continue() end, desc = "continue"},
                {"<leader>bo", function() require("dap").step_over() end, desc = "step over"},
                {"<leader>bi", function() require("dap").step_into() end, desc = "step into"},
                {"<leader>be", function() require("dap").step_out() end, desc = "step out"},
                {"<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint"},
                {"<leader>f", group = "find"},
                {"<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find File"},
                {"<leader>fs", function() require("telescope.builtin").grep_string() end, desc = "Grep word under cursor"},
                {"<leader>f.", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "Find hidden files"},
                {"<leader>fc", function() require("telescope.builtin").command_history() end, desc = "command history"},
                {"<leader>fa", function() require("telescope.builtin").builtin() end, desc = "all pickers"},
                {"<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep"},
                {"<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers"},
                {"<leader>f?", function() require("telescope.builtin").help_tags() end, desc = "Help Tags"},
                {"<leader>fr",  "<cmd>Telescope rage<CR>", desc = "Rage" },
                {"<leader>fm", function() require("telescope.builtin").marks() end, desc = "Marks"},
                {"<leader>fj", function() require("telescope.builtin").jumplist() end, desc = "Jumplist"},
                {"<leader>fq", function() require("telescope.builtin").quickfix() end, desc = "quickfix"},
                {"<leader>c", group = "text-case"},
                {"<leader>ct", "<cmd>TextCaseOpenTelescope<CR>", desc = "Text case Telescope"},
                {"<leader>x", group = "inspect"},
                {"<leader>xt", function() require("trouble").toggle() end, desc = "Toggle trouble"},
                {"<leader>t", group = "test"},
                {"<leader>tr", function() require("neotest").run.run() end, desc = "Run test"},
                {"<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug test"},
                {"<leader>tg", function() require("dap-go").debug_test() end, desc = "Debug go test"},
                {"<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run current file"},
                {"<leader>tp", "<cmd>Neotest output-panel<CR>", desc = "Output panel" },
                {"<leader>to", "<cmd>Neotest output<CR>", desc = "Output" },
                {"<leader>ts", "<cmd>Neotest summary<CR>", desc = "summary" },
            })
        end,
    },
}
