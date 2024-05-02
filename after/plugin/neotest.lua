require("neotest").setup({
    adapters = {
        require("neotest-java"),
        require("neotest-python")
    }
})

vim.keymap.set("n", "<leader>tm", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Test method" })
vim.keymap.set("n", "<leader>dm", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
    { desc = "Debug method" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Test file" })
vim.keymap.set("n", "<leader>da", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'), {strategy = 'dap'})<cr>",
    { desc = "Debug file" })
