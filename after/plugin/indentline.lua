vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    theme = "monokai",
    space_char_blankline = " ",
}

require("mini.indentscope").setup({
    symbol = "│",
    options = {
        try_as_border = true
    }
})
