return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        enabled = not vim.g.vscode,
        cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
        keys = {
            { "<leader>ee", "<cmd>NvimTreeToggle<CR>",   desc = "Toggle NvimTree" },
            { "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "NvimTree find file" },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
    },
}
