require("neotest").setup({
    adapters = {
        require("neotest-java"),
        require("neotest-python")
    }
})

require("dapui").setup(
    {
        layouts = { {
            elements = { {
                id = "watches",
                size = 0.33
            }, {
                id = "breakpoints",
                size = 0.33
            }, {
                id = "stacks",
                size = 0.33
            } },
            position = "left",
            size = 40
        }, {
            elements = { {
                id = "repl",
                size = 0.5
            }, {
                id = "scopes",
                size = 0.5
            } },
            position = "bottom",
            size = 10
        } },
    })
require('dap-python').setup()

vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "DAP UI" })
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dC", "<cmd>lua require('dap').clear_breakpoints()<cr>", { desc = "Clear all Breakpoints" })
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>dsi", "<cmd>lua require('dap').step_into()<cr>", { desc = "Step Into" })
vim.keymap.set("n", "<leader>dso", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })
vim.keymap.set("n", "<leader>dsO", "<cmd>lua require('dap').step_out()<cr>", { desc = "Step Out" })
vim.keymap.set("n", "<leader>dS",
    '<cmd>lua require("dapui").float_element("scopes", {position = "center", width = 60, height = 40})<cr><cmd>lua require("dapui").float_element("scopes", {position = "center", width = 60, height = 40})<cr>',
    { desc = "Show scopes" })
vim.keymap.set("n", "<leader>dC",
    '<cmd>lua require("dapui").float_element("console", {position = "center", width = 60, height = 40})<cr>',
    { desc = "Show console" })
vim.keymap.set("n", "<leader>dr",
    '<cmd>lua require("dapui").float_element("repl", {position = "center", width = 100, height = 60})<cr><cmd>lua require("dapui").float_element("repl", {position = "center", width = 100, height = 60})<cr>',
    { desc = "Show REPL" })
vim.keymap.set("v", "<leader>dR", "<cmd>lua require('dapui').eval()<cr>", { desc = "Evaluate expression" })

vim.keymap.set("n", "<leader>tm", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Test method" })
vim.keymap.set("n", "<leader>dm", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
    { desc = "Debug method" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Test file" })
vim.keymap.set("n", "<leader>df", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'), {strategy = 'dap'})<cr>",
    { desc = "Debug file" })
