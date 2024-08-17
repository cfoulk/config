local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local conf = require("telescope.config").values

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local dropdown = require "telescope.themes".get_dropdown()

function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    local backup = prompt_bufnr
    if selected == nil then
        actions.close(backup)
        return false
    end

    -- if nil == selected then
    --     actions.close(prompt_bufnr)
    --     return false
    -- end

    print(selected[1])
    local cmd = 'sb ' .. selected[1]
    -- local cmd = 'colorscheme ' .. selected[1]
    actions.close(backup)
    vim.cmd(cmd)
end

-- local bufs = vim.iter(vim.api.nvim_list_bufs()):filter(vim.api.nvim_buf_is_loaded)
--

local bufnrs = vim.api.nvim_list_bufs()
local open_bufnrs = {}

for _, bufnr in ipairs(bufnrs) do
  if vim.api.nvim_buf_is_loaded(bufnr) then
    local str = {tostring(bufnr), vim.api.nvim_buf_get_name(bufnr), tostring(bufnr) .. " - " .. vim.api.nvim_buf_get_name(bufnr)}
    table.insert(open_bufnrs, str)
    -- print(bufnr)
  end
end

-- local bufnrs = vim.tbl_filter(function(bufnr)
--   return vim.fn.buflisted(bufnr) == 1
-- end, vim.api.nvim_list_bufs())

local opts = {

    -- finder = finders.new_table {"blue", "darkblue", "default"},
    -- finder = finders.new_table {"1", "7", "14"},
    -- finder = bufnrs,
    -- finder = finders.new_table ( open_bufnrs ),
    finder = open_bufnrs,
    sorter = sorters.get_generic_fuzzy_sorter({}),

    attach_mappings = function(prompt_bufnr, map)
        map("i", "<CR>", enter)
        map("n", "<CR>", enter)
        return true
    end
}

local buf_split_picker = pickers.new(dropdown, opts)

-- buf_split_picker:find()
