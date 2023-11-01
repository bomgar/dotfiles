
local plugin_specs = {
  -- auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-emoji",
    },
    config = function()
      require("config.nvim-cmp")
    end,
  },



  -- A list of colorscheme plugin you may want to try. Find what suits you.
  { "navarasu/onedark.nvim", lazy = true },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    cond = firenvim_not_active,
    config = function()
      require("config.statusline")
    end,
  },
  {
    'tummetott/unimpaired.nvim',
    vscode = true,
    config = function()
      require('unimpaired').setup {
        -- add any options here or leave empty
      }
    end
  },

  {
    "ur4ltz/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  },

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("config.telescope")
    end,
  },


  -- Comment plugin
  { "tpope/vim-commentary", event = "VeryLazy" },

  -- Show undo history visually
  { "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } },

  -- better UI for some nvim actions
  { "stevearc/dressing.nvim" },

  -- Git command inside vim
  {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
  },

  -- Better git log display
  { "rbong/vim-flog", cmd = { "Flog" } },
  { "christoomey/vim-conflicted", cmd = { "Conflicted" } },
  {
    "ruifm/gitlinker.nvim",
    event = "User InGitRepo",
  },

  -- Show git change (change, delete, add) signs in vim sign column
  {
    "lewis6991/gitsigns.nvim",
  },

  -- Better git commit experience
  { "rhysd/committia.vim" },

  {
    "sindrets/diffview.nvim"
  },

  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- Another markdown plugin
  { "preservim/vim-markdown", ft = { "markdown" } },

  -- Vim tabular plugin for manipulate tabular, required by markdown plugins
  { "godlygeek/tabular", cmd = { "Tabularize" } },

  { "chrisbra/unicode.vim", event = "VeryLazy" },

  -- Modern matchit implementation
  { "andymass/vim-matchup", event = "BufRead" },
  { "tpope/vim-scriptease", cmd = { "Scriptnames", "Message", "Verbose" } },

  -- Asynchronous command execution
  { "skywind3000/asyncrun.vim", lazy = true, cmd = { "AsyncRun" } },
  { "cespare/vim-toml", ft = { "toml" }, branch = "main" },

  -- The missing auto-completion for cmdline!
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",
  },

  -- showing keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
      }
    end
  },

  -- show and trim trailing whitespaces
  { "ntpeters/vim-better-whitespace" },


}

-- configuration for lazy itself.
local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
}

require("lazy").setup(plugin_specs, lazy_opts)
