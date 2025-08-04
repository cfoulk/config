require('telescope').setup {
    defaults = {
        path_display = { "truncate" },
    },
    pickers = {
        -- find_files = {
        --     theme = "dropdown",
        -- },
        -- buffers = {
        --     theme = "dropdown",
        -- }
    },
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fv', function()
    builtin.find_files({ hidden = true, no_ignore = true })
end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})
