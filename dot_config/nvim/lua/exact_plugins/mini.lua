return {
    {
        'echasnovski/mini.nvim',
        version = false,
        keys = {
            { "<leader>go", function() MiniDiff.toggle_overlay() end,    desc = "Toggle minidiff overlay" },
        },
        lazy = false,
        config = function()
            require("mini.icons").setup({})

            require("mini.indentscope").setup({})
            local disableIndent = function(args) vim.b[args.buf].miniindentscope_disable = true end
            vim.api.nvim_create_autocmd('Filetype', { pattern = 'fzf', callback = disableIndent })

            require("mini.trailspace").setup({})
            require("mini.files").setup({})
            require("mini.hipatterns").setup({
                highlighters = {
                    fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
                    hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
                    todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
                    note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

                },
            })
            require("mini.splitjoin").setup({})
            require("mini.diff").setup({
                view = {
                    style = "sign"
                }
            })
            local ai = require("mini.ai")
            ai.setup({
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({ -- code block
                        a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                        i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                    }),
                    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
                    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),       -- class
                    d = { "%f[%d]%d+" },                                                          -- digits
                    u = ai.gen_spec.function_call(),                                              -- u for "Usage"
                    U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),                    -- without dot in function name
                },
            })
        end
    },
}
