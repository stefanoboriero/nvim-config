local monokai = require("monokai-pro")

monokai.setup({
    transparent_background = false,
    devicons               = true,
    filter                 = "classic",    -- classic | octagon | pro | machine | ristretto | spectrum
    inc_search             = "background", -- underline | background
    background_clear       = { "nvim-tree", "neo-tree", "bufferline", "notify" },
    plugins                = {
        bufferline = {
            underline_selected = true,
            underline_visible = false,
            underline_fill = true,
            bold = false,
        },
        indent_blankline = {
            context_highlight = "classic", -- default | pro
            context_start_underline = true,
        },
    },
    override               = function(c)
        return {
            ColorColumn = { bg = c.base.dimmed3 },
            -- Mine
            DashboardRecent = { fg = c.base.magenta },
            DashboardProject = { fg = c.base.blue },
            DashboardConfiguration = { fg = c.base.white },
            DashboardSession = { fg = c.base.green },
            DashboardLazy = { fg = c.base.cyan },
            DashboardServer = { fg = c.base.yellow },
            DashboardQuit = { fg = c.base.red },
        }
    end,
})

monokai.load()

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "Format" })
