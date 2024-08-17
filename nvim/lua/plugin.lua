local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- 'nvim-treesitter/nvim-treesitter',
    -- 'williamboman/mason.nvim',
    -- 'williamboman/mason-lspconfig.nvim',
    -- 'neovim/nvim-lspconfig',
    -- 'jose-elias-alvarez/null-ls.nvim',
    -- {
    --     'MunifTanjim/prettier.nvim',
    --     confing = function()
    --         local prettier = require("prettier")
    --         prettier.setup({
    --             bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
    --             filetypes = {
    --                 "css",
    --                 "graphql",
    --                 "html",
    --                 "javascript",
    --                 "javascriptreact",
    --                 "json",
    --                 "less",
    --                 "markdown",
    --                 "scss",
    --                 "typescript",
    --                 "typescriptreact",
    --                 "yaml",
    --             },
    --         })
    --     end
    -- },
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    -- -- 'mfussenegger/nvim-jdtls',
    'Raimondi/delimitMate',
    -- Snippets
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- 'nvim-tree/nvim-web-devicons',
    -- {
    --     'akinsho/bufferline.nvim',
    --     version = "*",
    --     dependencies = 'nvim-tree/nvim-web-devicons',
    --     config = function()
    --         local bufferline = require("bufferline")
    --         bufferline.setup {
    --             options = {
    --                 style_preset = bufferline.style_preset.no_italic,
    --                 indicator = {
    --                     style = 'none',
    --                 },
    --                 show_buffer_icons = false, -- disable filetype icons for buffers
    --                 show_buffer_close_icons = false,
    --                 show_close_icon = false,
    --                 enforce_regular_tabs = true,
    --             }
    --         }
    --     end
    -- },
    -- {
    --     'navarasu/onedark.nvim',
    --     priority = 1000,
    --     config = function()
    --         local theme = 'cool'
    --         local onedark = require('onedark')
    --         onedark.setup {
    --             style = theme,
    --         }
    --         onedark.load()
    --         local cursor_color = require("onedark.palette")[theme].yellow
    --         vim.cmd("hi CursorLineNr guifg=" .. cursor_color)
    --     end,
    -- },
    -- 'ap/vim-css-color',
    'tpope/vim-commentary',
    -- 'tpope/vim-fugitive',
    'tpope/vim-surround',
}

local opts = {}

require("lazy").setup(plugins, opts)
-- vim.cmd [[colorscheme rose-pine-moon]]
