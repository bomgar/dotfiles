return {
    {
        "nvim-tree/nvim-tree.lua",
        lazy = true,
        enabled = not vim.g.vscode,
        cmd = { "NvimTreeToggle" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("nvim-tree").setup()
        end,
    },
}
