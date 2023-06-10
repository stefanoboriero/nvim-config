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
        'andy-bell101/neotest-java'
    },
    {
        'mfussenegger/nvim-dap'
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {"mfussenegger/nvim-dap"}
    },
}
