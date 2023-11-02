return{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    enabled = not vim.g.vscode,
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "bash",
          "c",
          "css",
          "scss",
          "rust",
          "svelte",
          "astro",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
          "git_config",
          "gitignore",
          "hocon",
          "kotlin",
          "sql",
        },
      })
    end
  },
}
