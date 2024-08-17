require('telescope').setup{
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    buffers = {
      theme = "dropdown",
    }
  },
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', [[<ESC><CMD>lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true })<CR>]], {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fr', builtin.git_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ft', builtin.treesitter, {})

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local dropdown = require "telescope.themes".get_dropdown({ previewer = false })

