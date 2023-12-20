vim.keymap.set('i', '<C-f>', 'copilot#Accept("")', {
    expr = true,
    replace_keycodes = false
})
vim.g.copilot_no_tab_map = 1
vim.g.copilot_assume_mapped = 1

return {
    {
        "github/copilot.vim",
        enabled = not vim.g.vscode,
    }
}
