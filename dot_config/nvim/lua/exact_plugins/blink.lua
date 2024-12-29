return {
    {
        'saghen/blink.cmp',
        lazy = false, -- lazy loading handled internally

        build = 'cargo build --release',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'super-tab',
                ['<C-j>'] = { 'snippet_forward', 'fallback' },
                ['<C-k>'] = { 'snippet_backward', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'mono'
            },
            completion = {
                documentation = {
                    auto_show = true,
                    auto_show_delay_ms = 200,
                },
            },


            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

        },
        opts_extend = { "sources.default" }
    },
}