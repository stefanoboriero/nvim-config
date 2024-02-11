vim.opt.list = true
vim.opt.listchars = { tab = "⇥ ", leadmultispace = "┊   ", trail = "␣", nbsp = "⍽" }

require("mini.indentscope").setup({
    symbol = "╎",
    options = {
        try_as_border = true
    }
})
