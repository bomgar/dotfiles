return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        keys = {
            { "<leader>un", function() Snacks.notifier.hide() end,    desc = "Dismiss All Notifications" },
            { "<leader>ud", function() Snacks.bufdelete() end,        desc = "Delete Buffer" },
            { "<F12>",      function() Snacks.lazygit() end,          desc = "Lazygit" },
            { "<leader>gB", function() Snacks.gitbrowse() end,        desc = "Git Browse" },
            { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
            { "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Lazygit Log (cwd)" },
            { "<leader>rr", function() Snacks.rename() end,           desc = "Rename File" },
            { "<c-/>",      function() Snacks.terminal() end,         desc = "Toggle Terminal" },
            { "<c-_>",      function() Snacks.terminal() end,         desc = "which_key_ignore" },
            { "<leader>uc", function() Snacks.bufdelete.other() end,  desc = "close all other buffers" },
        },
        opts =
        ---@class snacks.Config
        ---@field bigfile? snacks.bigfile.Config | { enabled: boolean }
        ---@field gitbrowse? snacks.gitbrowse.Config
        ---@field lazygit? snacks.lazygit.Config
        ---@field notifier? snacks.notifier.Config | { enabled: boolean }
        ---@field quickfile? { enabled: boolean }
        ---@field statuscolumn? snacks.statuscolumn.Config  | { enabled: boolean }
        ---@field terminal? snacks.terminal.Config
        ---@field toggle? snacks.toggle.Config
        ---@field styles? table<string, snacks.win.Config>
        ---@field win? snacks.win.Config
        ---@field words? snacks.words.Config
        {
            styles = {},
            bigfile = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = false },
        }
    }
}
