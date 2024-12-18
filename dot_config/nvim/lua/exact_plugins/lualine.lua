return {

    {
        "nvim-lualine/lualine.nvim",
        enabled = not vim.g.vscode,
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                theme = "catppuccin",
            })
        end,
    },
}
