return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        keys = {
            { "<leader>un", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
            { "<leader>uh", function() Snacks.notifier.show_history() end, desc = "Show notification history" },
            { "<leader>ud", function() Snacks.bufdelete() end,             desc = "Delete Buffer" },
            { "<F12>",      function() Snacks.lazygit() end,               desc = "Lazygit" },
            { "<leader>gB", function() Snacks.gitbrowse() end,             desc = "Git Browse" },
            { "<leader>gb", function() Snacks.git.blame_line() end,        desc = "Git blame" },
            { "<leader>gf", function() Snacks.lazygit.log_file() end,      desc = "Lazygit Current File History" },
            { "<leader>gl", function() Snacks.lazygit.log() end,           desc = "Lazygit Log (cwd)" },
            { "<leader>rr", function() Snacks.rename() end,                desc = "Rename File" },
            { "<c-/>",      function() Snacks.terminal() end,              desc = "Toggle Terminal" },
            { "<c-_>",      function() Snacks.terminal() end,              desc = "which_key_ignore" },
            { "<leader>uc", function() Snacks.bufdelete.other() end,       desc = "close all other buffers" },
        },
        config = function()
            require("snacks").setup(
                {
                    styles = {},
                    bigfile = { enabled = true },
                    notifier = { enabled = true },
                    quickfile = { enabled = true },
                    statuscolumn = { enabled = true },
                    dashboard = { enabled = true },
                    words = { enabled = false },
                    input = {
                        enabled = false,
                        win = {
                            relative = "win",
                        }
                    },
                }
            )
            Snacks.input.enable()
            vim.api.nvim_create_autocmd("User", {
                pattern = "MiniFilesActionRename",
                callback = function(event)
                    Snacks.rename.on_rename_file(event.data.from, event.data.to)
                end,
            })
        end
    }
}
