return {

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                    variant = "dawn",
            })
            vim.cmd("colorscheme rose-pine")
        end
    },
}
