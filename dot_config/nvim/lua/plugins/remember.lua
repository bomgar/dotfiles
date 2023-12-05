return {
    {
        "vladdoster/remember.nvim",
        enabled = not vim.g.vscode,
        config = function()
            require("remember")
        end,
    },
}
