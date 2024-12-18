return {
    {
        "dcampos/nvim-snippy",
        enabled = not vim.g.vscode,
        config = function()
            require("snippy").setup({})
            vim.api.nvim_set_keymap("i", "<C-j>", "<Plug>(snippy-next)", { silent = true })
            vim.api.nvim_set_keymap("s", "<C-j>", "<Plug>(snippy-next)", { silent = true })
        end,
    },
}
