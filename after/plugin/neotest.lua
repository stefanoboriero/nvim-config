require("neotest").setup({
  adapters = {
    require("neotest-java"),
    require("neotest-python")
  }
})

require("dapui").setup()
require('dap-python').setup()

vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", {desc = "DAP UI"})
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", {desc = "Toggle Breakpoint"})
vim.keymap.set("n", "<leader>dC", "<cmd>lua require('dap').clear_breakpoints()<cr>", {desc = "Clear all Breakpoints"})
vim.keymap.set("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", {desc = "Continue"})
vim.keymap.set("n", "<leader>dsi", "<cmd>lua require('dap').step_into()<cr>", {desc = "Step Into"})
vim.keymap.set("n", "<leader>dso", "<cmd>lua require('dap').step_over()<cr>", {desc = "Step Over"})
vim.keymap.set("n", "<leader>dsO", "<cmd>lua require('dap').step_out()<cr>", {desc = "Step Out"})

vim.keymap.set("n", "<leader>tm", "<cmd>lua require('neotest').run.run()<cr>", {desc = "Test method"})
vim.keymap.set("n", "<leader>dm", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", {desc = "Debug method"})
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", {desc = "Test file"})
vim.keymap.set("n", "<leader>df", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'), {strategy = 'dap'})<cr>", {desc = "Debug file"})
