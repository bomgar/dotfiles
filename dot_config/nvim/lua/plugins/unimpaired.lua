return {

    {
        "tummetott/unimpaired.nvim",
        vscode = true,
        config = function()
            require("unimpaired").setup({
                -- add any options here or leave empty
            })
        end,
    },
}
