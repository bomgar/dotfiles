return {
    {
        "bomgar/telescope-rage",
        --dir = "/home/phaun/development/projects/telescope-rage",
        enabled = not vim.g.vscode,
        dependencies = { "nvim-telescope/telescope.nvim" },
        keys = {
            { "<leader>fr", "<cmd>Telescope rage<CR>", desc = "Rage" },
        },
        config = function()
            require("telescope").load_extension("rage")
        end,
    }
}
