vim.pack.add( {'https://github.com/echasnovski/mini.indentscope'})
vim.opt.list = true
vim.opt.listchars = { tab = "⇥ ", leadmultispace = "┊   ", trail = "␣", nbsp = "⍽" }

require("mini.indentscope").setup({
    symbol = "╎",
    options = {
        try_as_border = true
    }
})
