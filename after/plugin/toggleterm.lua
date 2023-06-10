require("toggleterm").setup{
    direction = "float",
}

vim.keymap.set("n", "<leader>T", vim.cmd.ToggleTerm, {desc = "Terminal"})
