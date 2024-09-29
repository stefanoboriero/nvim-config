local delve_install = require('mason-registry')
    .get_package('delve')
    :get_install_path()

require('dap-go').setup(
    {
        delve = {
            path = delve_install .. '/dlv'
        }
    }
)
require("nvim-dap-virtual-text").setup()
require('dap-python').setup()
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

vim.keymap.set("n", "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", { desc = "DAP UI" })
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dC", "<cmd>lua require('dap').clear_breakpoints()<cr>", { desc = "Clear all Breakpoints" })
vim.keymap.set("n", "<leader>dd", "<cmd>lua require('dap').continue()<cr>", { desc = "Continue" })
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_into()<cr>", { desc = "Step Into" })
vim.keymap.set("n", "<leader>do", "<cmd>lua require('dap').step_over()<cr>", { desc = "Step Over" })
vim.keymap.set("n", "<leader>dO", "<cmd>lua require('dap').step_out()<cr>", { desc = "Step Out" })
vim.keymap.set("n", "<leader>ds",
    '<cmd>lua require("dapui").float_element("scopes", {position = "center", width = 60, height = 40})<cr><cmd>lua require("dapui").float_element("scopes", {position = "center", width = 60, height = 40})<cr>',
    { desc = "Show scopes" })
vim.keymap.set("n", "<leader>dl",
    '<cmd>lua require("dapui").float_element("console", {position = "center", width = 60, height = 40})<cr>',
    { desc = "Show console" })
vim.keymap.set("n", "<leader>df",
    '<cmd>lua require("dapui").float_element("repl", {position = "center", width = 100, height = 60})<cr><cmd>lua require("dapui").float_element("repl", {position = "center", width = 100, height = 60})<cr>',
    { desc = "Show REPL" })
vim.keymap.set("v", "<leader>de", "<cmd>lua require('dapui').eval()<cr>", { desc = "Evaluate expression" })
