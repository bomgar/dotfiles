return {
    {
        "lewis6991/gitsigns.nvim",
        enabled = not vim.g.vscode,
        config = function()
            require("gitsigns").setup()
        end,
    },
}
