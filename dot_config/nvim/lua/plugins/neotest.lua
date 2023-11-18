return {
  {
    "nvim-neotest/neotest",
    event="VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "haydenmeade/neotest-jest",
      "rouge8/neotest-rust",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rust"),
          require("neotest-go"),
          require('neotest-jest')({
            jestCommand = "npm test --",
            env = { },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
        }
      })
    end
  }
}
