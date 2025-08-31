return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('oil').setup({
            columns = { "icon" },
            view_options = {
                show_hidden = true,
            },
            git = {
                add = function(path)
                    return true
                end,
                mv = function(src_path, dest_path)
                    return true
                end,
                rm = function(path)
                    return true
                end,
            },
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end
}
