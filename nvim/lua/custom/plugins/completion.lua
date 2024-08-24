return {
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        priority = 100,
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip',
            { "L3MON4D3/LuaSnip", build = "cmake install_jsregexp" },
            'rafamadriz/friendly-snippets',
        },
        config = function()
            require "custom.completion"
        end,
    }
}
