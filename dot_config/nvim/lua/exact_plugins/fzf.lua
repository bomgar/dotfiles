return {

    {
        "ibhagwan/fzf-lua",
        enabled = not vim.g.vscode,
        dependencies = {
            "echasnovski/mini.nvim",
        },
        cmd = { "FzfLua" },
        event = "VeryLazy",
        keys = {
            { "<leader>ff", function() require("fzf-lua").files({ hidden = true }) end,     desc = "Find File" },
            { "<leader>fs", function() require("fzf-lua").grep_cword() end,                 desc = "Grep word under cursor" },
            { "<leader>fc", function() require("fzf-lua").command_history() end,            desc = "command history" },
            { "<leader>fa", function() require("fzf-lua").builtin() end,                    desc = "all pickers" },
            { "<leader>fg", function() require("fzf-lua").live_grep() end,                  desc = "Live Grep" },
            { "<leader>fb", function() require("fzf-lua").buffers() end,                    desc = "Buffers" },
            { "<leader>f?", function() require("fzf-lua").help_tags() end,                  desc = "Help Tags" },
            { "<leader>fw", function() require("fzf-lua").lsp_live_workspace_symbols() end, desc = "Live workspace symbols" },
            { "<leader>fm", function() require("fzf-lua").marks() end,                      desc = "Marks" },
            { "<leader>fj", function() require("fzf-lua").jumps() end,                      desc = "Jumplist" },
            { "<leader>fq", function() require("fzf-lua").quickfix() end,                   desc = "quickfix" },
            { "<leader>fo", function() require("fzf-lua").oldfiles() end,                   desc = "Old files" },
        },
        config = function()
            local fzf = require("fzf-lua")
            fzf.setup({
                keymap   = {
                    builtin = {
                        true,
                        ["<C-d>"] = "preview-page-down",
                        ["<C-u>"] = "preview-page-up",
                    },
                    fzf = {
                        ["ctrl-d"] = "preview-page-down",
                        ["ctrl-u"] = "preview-page-up",
                        ["ctrl-q"] = "select-all+accept",
                    },
                },
                oldfiles = {
                    include_current_session = true,
                },
                files    = {
                    cwd_prompt = false,
                },
                fzf_opts = { ['--layout'] = 'default' }
            })
            fzf.register_ui_select(function(_, items)
                local min_h, max_h = 0.15, 0.70
                local h = (#items + 4) / vim.o.lines
                if h < min_h then
                    h = min_h
                elseif h > max_h then
                    h = max_h
                end
                return { winopts = { height = h, width = 0.60, row = 0.40 } }
            end)
        end,
    },
}
