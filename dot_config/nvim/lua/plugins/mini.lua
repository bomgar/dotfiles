return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("mini.icons").setup({})
            require("mini.indentscope").setup({})
            require("mini.comment").setup({})
            require("mini.trailspace").setup({})
            require("mini.files").setup({})
            require("mini.splitjoin").setup({})
            local ai = require("mini.ai")
            ai.setup({
                n_lines = 500,
                custom_textobjects = {
                    o = ai.gen_spec.treesitter({ -- code block
                        a = {"@block.outer", "@conditional.outer", "@loop.outer"},
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
