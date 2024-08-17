
--vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

--local cmp = require('cmp')
--local luasnip = require('luasnip')
---- might need to refactor this
--require("luasnip.loaders.from_vscode").lazy_load()

--local select_opts = {behavior = cmp.SelectBehavior.Select}

--cmp.setup({
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end
--  },
--  sources = {
--    {name = 'nvim_lsp' },
--    {name = 'path'},
--    {name = 'luasnip' },
--    {name = 'buffer', keyword_length = 5},
--  },
--  window = {
--    documentation = cmp.config.window.bordered()
--  },
--  formatting = {
--    fields = {'menu', 'abbr', 'kind'},
--    format = function(entry, item)
--      local menu_icon = {
--        nvim_lsp = '[LSP]',
--        luasnip = '[luasnip]',
--        buffer = '[buf]',
--        path = '[path]',
--      }

--      item.menu = menu_icon[entry.source.name]
--      return item
--    end,
--  },
--  mapping = {
--    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
--    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

--    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--    ['<C-d>'] = cmp.mapping.scroll_docs(4),

--    ['<C-e>'] = cmp.mapping.abort(),
--    ['<C-y>'] = cmp.mapping.confirm({select = true}),
--    ['<CR>'] = cmp.mapping.confirm({select = false}),

--    ['<C-f>'] = cmp.mapping(function(fallback)
--    --['<CR>'] = cmp.mapping(function(fallback)
--      if luasnip.jumpable(1) then
--        luasnip.jump(1)
--      else
--        fallback()
--      end
--    end, {'i', 's'}),

--    ['<C-b>'] = cmp.mapping(function(fallback)
--      if luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, {'i', 's'}),

--    ['<Tab>'] = cmp.mapping(function(fallback)
--      local col = vim.fn.col('.') - 1

--      if cmp.visible() then
--        cmp.select_next_item(select_opts)
--      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--        fallback()
--      else
--        cmp.complete()
--      end
--    end, {'i', 's'}),

--    ['<S-Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item(select_opts)
--      else
--        fallback()
--      end
--    end, {'i', 's'}),
--  },
--})
