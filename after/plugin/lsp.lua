local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
    "lua_ls",
    "jdtls",
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        { buffer = bufnr, remap = false, desc = "Goto Definition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, remap = false, desc = "view diagnostics" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end,
        { buffer = bufnr, remap = false, desc = "View Code Actions" })
    vim.keymap.set("n", "<leader>vr", function() require('telescope.builtin').lsp_references() end,
        { buffer = bufnr, remap = false, desc = "View References" })
    vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.rename() end,
        { buffer = bufnr, remap = false, desc = "Code Rename" })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.skip_server_setup({ 'jdtls' })
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
