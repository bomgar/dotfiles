return {
    {
        "johmsalas/text-case.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        enabled = not vim.g.vscode,
        cmd = {"TextCaseOpenTelescope"},
        keys = {
            { "<leader>ct", "<cmd>TextCaseOpenTelescope<CR>", desc = "Text case Telescope" },
        },
        config = function()
            require("textcase").setup({})
            require("telescope").load_extension("textcase")
        end,
    },
}
