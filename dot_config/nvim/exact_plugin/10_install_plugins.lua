vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/rose-pine/neovim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/b0o/SchemaStore.nvim",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/leoluz/nvim-dap-go",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/jay-babu/mason-nvim-dap.nvim",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range('1.*') },
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/MagicDuck/grug-far.nvim",
  "https://github.com/towolf/vim-helm",
  "https://github.com/NoahTheDuke/vim-just",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/cespare/vim-toml",
  "https://github.com/mistweaverco/kulala.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-neotest/neotest",
  "https://github.com/antoinemadec/FixCursorHold.nvim",
  "https://github.com/haydenmeade/neotest-jest",
  "https://github.com/rouge8/neotest-rust",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/fredrikaverpil/neotest-golang",
  "https://github.com/kevinhwang91/nvim-bqf",
  "https://github.com/catgoose/nvim-colorizer.lua",
  "https://github.com/bomgar/rage.nvim",
  "https://github.com/vladdoster/remember.nvim",
  "https://github.com/leath-dub/snipe.nvim",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/folke/trouble.nvim",
})
