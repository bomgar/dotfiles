return{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    enabled = not vim.g.vscode,
    config = function ()
      local configs = require("nvim-treesitter.configs")
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

      configs.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "css",
          "diff",
          "dockerfile",
          "git_config",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "gitignore",
          "hocon",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "kotlin",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "rust",
          "scss",
          "sql",
          "ssh_config",
          "svelte",
          "terraform",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
      })
    end
  },
}
