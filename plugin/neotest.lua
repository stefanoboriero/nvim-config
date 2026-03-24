
vim.pack.add ({
        'https://github.com/nvim-neotest/neotest',
        'https://github.com/nvim-neotest/nvim-nio',
        'https://github.com/nvim-lua/plenary.nvim',
        'https://github.com/nvim-treesitter/nvim-treesitter',
        'https://github.com/antoinemadec/FixCursorHold.nvim',
        'https://github.com/nvim-neotest/neotest-python',
        'https://github.com/rcasia/neotest-java',
        'https://github.com/fredrikaverpil/neotest-golang',
        'https://github.com/leoluz/nvim-dap-go',
})

require("neotest").setup({
    adapters = {
        require("neotest-python"),
        require("neotest-java"),
        require("neotest-golang"),
    }
})

vim.keymap.set("n", "<leader>dm", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
    { desc = "Debug method" })
vim.keymap.set("n", "<leader>da", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'), {strategy = 'dap'})<cr>",
    { desc = "Debug file" })

vim.keymap.set("n", "<leader>tm", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Test method" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Test file" })

vim.keymap.set("n", "<leader>to", "<cmd>lua require('neotest').output.open()<cr>", { desc = "Test output" })
vim.keymap.set("n", "<leader>tl", "<cmd>lua require('neotest').run.run_last()<cr>", { desc = "Test last" })
vim.keymap.set("n", "<leader>tw", "<cmd>lua require('neotest').watch.toggle()<cr>", { desc = "Test watch" })
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Test Summary" })
