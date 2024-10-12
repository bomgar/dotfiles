return {

    {
        "nvim-telescope/telescope.nvim",
        enabled = not vim.g.vscode,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "natecraddock/telescope-zf-native.nvim",
        },
        cmd = {"Telescope"},
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files({ hidden = true }) end,                   desc = "Find File" },
            { "<leader>fs", function() require("telescope.builtin").grep_string() end,                                   desc = "Grep word under cursor" },
            { "<leader>f.", function() require("telescope.builtin").find_files({ hidden = true, no_ignore = true }) end, desc = "Find ignored files" },
            { "<leader>fc", function() require("telescope.builtin").command_history() end,                               desc = "command history" },
            { "<leader>fa", function() require("telescope.builtin").builtin() end,                                       desc = "all pickers" },
            { "<leader>fg", function() require("telescope.builtin").live_grep() end,                                     desc = "Live Grep" },
            { "<leader>fb", function() require("telescope.builtin").buffers() end,                                       desc = "Buffers" },
            { "<leader>f?", function() require("telescope.builtin").help_tags() end,                                     desc = "Help Tags" },
            { "<leader>fm", function() require("telescope.builtin").marks() end,                                         desc = "Marks" },
            { "<leader>fj", function() require("telescope.builtin").jumplist() end,                                      desc = "Jumplist" },
            { "<leader>fq", function() require("telescope.builtin").quickfix() end,                                      desc = "quickfix" },
        },
        config = function()
            local builtin = require("telescope.builtin")
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "^.git/" },
                },
            })
            telescope.load_extension("zf-native")
        end,
    },
}
