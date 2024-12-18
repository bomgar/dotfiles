return {
    {
        "j-hui/fidget.nvim",
        enabled = not vim.g.vscode,
        opts = {

            integration = {
                ["nvim-tree"] = {
                    enable = false,
                },
            },
        },
    },
}
