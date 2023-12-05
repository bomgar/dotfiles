return {
    {
        "ThePrimeagen/harpoon",
        enabled = not vim.g.vscode,
        dependencies = { "nvim-telescope/telescope.nvim" },
        event = "VeryLazy",
        config = function()
            require("harpoon").setup({})
            require("telescope").load_extension("harpoon")
        end,
    },
}
