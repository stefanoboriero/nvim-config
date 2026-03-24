vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/L3MON4D3/LuaSnip',
    'https://github.com/mfussenegger/nvim-jdtls',
    'https://github.com/rafamadriz/friendly-snippets',
    {src = 'https://github.com/saghen/blink.cmp', version= "v1" }
})

vim.lsp.enable({ 'lua_ls', 'gopls', 'jdtls' })

require("mason").setup()
require("blink.cmp").setup()
