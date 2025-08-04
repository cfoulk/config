local cmp = require 'cmp'
local luasnip = require 'luasnip'



luasnip.config.setup {}


require("luasnip.loaders.from_vscode").lazy_load()


cmp.setup {
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },

    -- For an understanding of why these mappings were
    -- chosen, you will need to read `:help ins-completion`
    --
    -- No, but seriously. Please read `:help ins-completion`, it is really good!
    mapping = cmp.mapping.preset.insert {
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-y>'] = cmp.mapping.confirm { select = true },
      -- ['<C-Space>'] = cmp.mapping.complete {},
      ['<C-i>'] = cmp.mapping.complete {}, -- perhaps I could find a better binding for this?
      ['<C-l>'] = cmp.mapping(function()
        if luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        end
      end, { 'i', 's' }),
      ['<C-h>'] = cmp.mapping(function()
        if luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        end
      end, { 'i', 's' }),
    },
    sources = {
      {
        name = 'lazydev',
        -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
        group_index = 0,
      },
      { name = 'render-markdown' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
    },
}
