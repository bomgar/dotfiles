return {

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                integrations = {
                    cmp = true,
                    flash = true,
                    gitsigns = true,
                    lsp_trouble = true,
                    markdown = true,
                    mason = true,
                    neotest = true,
                    neotree = true,
                    nvimtree = true,
                    rainbow_delimiters = true,
                    telescope = { enabled = true },
                    treesitter = true,
                    which_key = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
