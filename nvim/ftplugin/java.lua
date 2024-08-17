local jdtls = require('jdtls')
local lolol = require('locals')
local keymap = vim.keymap.set
local capabilities = vim.lsp.protocol.make_client_capabilities();
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities);

local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap("n", "gD", vim.lsp.buf.declaration, opts)
    keymap("n", "gd", vim.lsp.buf.definition, opts)
    keymap("n", "K", vim.lsp.buf.hover, opts)
    keymap("n", "gi", vim.lsp.buf.implementation, opts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    keymap("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap("n", "gr", vim.lsp.buf.references, opts)
    keymap("n", "<leader>fm", function() vim.lsp.buf.format { async = true } end, opts)

    keymap("n", "<A-o>", jdtls.organize_imports, opts)
    keymap("n", "crv", jdtls.extract_variable, opts)
    keymap("n", "crc", jdtls.extract_constant, opts)
    keymap("v", "crv", [[<ESC><CMD>lua require("jdtls").extract_variable(true)<CR>]], opts)
    keymap("v", "crc", [[<ESC><CMD>lua require("jdtls").extract_constant(true)<CR>]], opts)
    keymap("v", "crm", [[<ESC><CMD>lua require("jdtls").extract_method(true)<CR>]], opts, "Extract Method")
end

local config = {
    cmd = { lolol.jdtls },
    -- cmd = { vars.jdtls_path },
    root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
    capabilities = capabilities,
    on_attach = on_attach,
}

jdtls.start_or_attach(config)
