return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        enabled = not vim.g.vscode,
        config = function()
            local configs = require("nvim-treesitter.configs")
            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

            configs.setup({
                highlight = { enable = true },
                indent = { enable = true },
                matchup = {
                    enable = true,
                },
                ensure_installed = {
                    "astro",
                    "bash",
                    "c",
                    "css",
                    "csv",
                    "diff",
                    "dockerfile",
                    "fish",
                    "git_config",
                    "git_config",
                    "git_rebase",
                    "gitattributes",
                    "gitcommit",
                    "gitignore",
                    "gitignore",
                    "go",
                    "gomod",
                    "gosum",
                    "gowork",
                    "hocon",
                    "html",
                    "javascript",
                    "jsdoc",
                    "json",
                    "jsonc",
                    "kdl",
                    "kotlin",
                    "lua",
                    "luadoc",
                    "luap",
                    "markdown",
                    "markdown_inline",
                    "proto",
                    "python",
                    "query",
                    "regex",
                    "ruby",
                    "rust",
                    "scss",
                    "sql",
                    "ssh_config",
                    "svelte",
                    "templ",
                    "terraform",
                    "toml",
                    "tsx",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml",
                    "zig",
                },
            })
        end,
    },
}
