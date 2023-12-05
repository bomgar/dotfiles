return {
    {
        "NvChad/nvim-colorizer.lua",
        enabled = not vim.g.vscode,
        config = function()
            require("colorizer").setup({
                user_default_options = {
                    names = false,
                },
                filetypes = {
                    "*", -- Highlight all files, but customize some others.
                    css = { css = true, names = true },
                    scss = { css = true, names = true },
                    svelte = { css = true, names = true },
                    astro = { css = true, names = true },
                },
            })
        end,
    },
}
