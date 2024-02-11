return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        }
    },
    {
        "nvim-neotest/neotest-python"
    },
    {
        'andy-bell101/neotest-java'
    },
    {
        'mfussenegger/nvim-dap'
    },
    {
        'mfussenegger/nvim-dap-python'
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { "mfussenegger/nvim-dap" }
    },
}
