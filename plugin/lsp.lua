vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/mfussenegger/nvim-jdtls',
    'https://github.com/rafamadriz/friendly-snippets',
    {src = 'https://github.com/saghen/blink.cmp', version= "v1" }
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, { buffer = bufnr, remap = false, desc = "Goto Definition" })
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end, { buffer = bufnr, remap = false, desc = "view diagnostics" })
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
        end, opts)
        vim.keymap.set("n", "<leader>ca", function()
            vim.lsp.buf.code_action()
        end, { buffer = bufnr, remap = false, desc = "View Code Actions" })
        vim.keymap.set("n", "<leader>vr", function()
            require("telescope.builtin").lsp_references()
        end, { buffer = bufnr, remap = false, desc = "View References" })
        vim.keymap.set("n", "<leader>cr", function()
            vim.lsp.buf.rename()
        end, { buffer = bufnr, remap = false, desc = "Code Rename" })
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "<leader>F", function()
            require("conform").format({ lsp_fallback = true })
        end, { desc = "Format" })
    end
})

vim.lsp.enable({ 'lua_ls', 'gopls', 'jdtls' })

require("mason").setup()
require("blink.cmp").setup()
