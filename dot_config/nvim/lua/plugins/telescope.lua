return {

    {
        "nvim-telescope/telescope.nvim",
        enabled = not vim.g.vscode,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "natecraddock/telescope-zf-native.nvim",
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
