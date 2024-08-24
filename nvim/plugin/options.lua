vim.opt.guicursor = ""

vim.opt.title = true
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.termguicolors = true
vim.opt.cursorline = true

-- insert mode different cursor
vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'

vim.opt.conceallevel = 1

-- No more blank padding from terminal
-- vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
--   callback = function()
--     local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
--     if not normal.bg then return end
--     io.write(string.format("\027]11;#%06x\027\\", normal.bg))
--   end,
-- })

-- vim.api.nvim_create_autocmd("UILeave", {
--   callback = function() io.write("\027]111\027\\") end,
-- })
