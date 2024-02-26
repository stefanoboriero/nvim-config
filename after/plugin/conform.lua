require("conform").setup({
    formatters_by_ft = {
        python = { "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
    },
})
