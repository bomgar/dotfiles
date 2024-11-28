return {
    { 'echasnovski/mini.nvim',
        version = '*',
        config = function ()
            require("mini.indentscope").setup({})
            require("mini.comment").setup({})
            require("mini.trailspace").setup({})
        end
    },
}
