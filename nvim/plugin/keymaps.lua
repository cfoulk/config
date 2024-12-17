
-- key mapping
local keymap = vim.keymap.set


keymap("i", "<C-\\>", "<C-w>")

-- Copy to clipboard
keymap("v", "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+yg_]])
keymap("n", "<leader>y", [["+y]])
keymap("n", "<leader>yy", [["+yy]])

-- Paste from clipboard
keymap("v", "<leader>p", [["+p]])
keymap("v", "<leader>P", [["+P]])
keymap("n", "<leader>p", [["+p]])
keymap("n", "<leader>P", [["+P]])

keymap("n", "J", [[mzJ`z]])
keymap("n", "<C-d>", [[<C-d>zz]])
keymap("n", "<C-u>", [[<C-u>zz]])
keymap("n", "n", [[nzzzv]])
keymap("n", "N", [[Nzzzv]])
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap("n", "<leader>l", [[:nohl<CR>]])

keymap('n', 'yc', function() vim.api.nvim_feedkeys('yygccp', 'm', false) end)

-- Move entire line up/down
keymap("n", "<C-Up>", [[ddkP]])
keymap("n", "<C-Down>", [[ddp]])

-- Append new line above/below
keymap("n", "<leader>O", [[m`O<ESC>``]])
keymap("n", "<leader>o", [[m`o<ESC>``]])

-- keymap("n", "<leader>u", [[<ESC><CMD>Ex<CR>]])

-- Moving within my buffer list
-- keymap("n", "H", [[<ESC><CMD>bprevious<CR>]])
-- keymap("n", "L", [[<ESC><CMD>bnext<CR>]])
-- keymap("n", "<leader>d", [[<ESC><CMD>bdelete<CR>]])
keymap("n", "H", [[gT]])
keymap("n", "L", [[gt]])

-- Splits
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-l>", "<C-w>l")
