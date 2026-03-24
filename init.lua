-- Setting up editor configuration
vim.g.mapleader = " "
vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "NetRW" })
vim.keymap.set("n", "<leader>l", vim.cmd.Lazy, { desc = "Lazy" })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("o", "w", "iw", { remap = false })
vim.keymap.set("o", "(", "i(", { remap = false })
vim.keymap.set("o", '"', 'i"', { remap = false })

-- Plugin installation
vim.pack.add({"https://github.com/windwp/nvim-autopairs"})
require("nvim-autopairs").setup({})

vim.pack.add({ 'https://github.com/ellisonleao/gruvbox.nvim'})
vim.cmd.colorscheme "gruvbox"
vim.cmd("highlight ColorColumn guibg=#31322c")

vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require("conform").setup({
    formatters_by_ft = {
        python = { "ruff_format" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    },
})

vim.pack.add( {"https://github.com/tpope/vim-fugitive"} )

vim.pack.add( {'https://github.com/echasnovski/mini.indentscope'})
vim.opt.list = true
vim.opt.listchars = { tab = "⇥ ", leadmultispace = "┊   ", trail = "␣", nbsp = "⍽" }

require("mini.indentscope").setup({
    symbol = "╎",
    options = {
        try_as_border = true
    }
})

vim.pack.add({ 
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
})

require('lualine').setup {
    options = {
        -- ...
        theme = 'gruvbox'
        -- ...
    }
}

vim.pack.add({'https://github.com/folke/which-key.nvim'})

local wk = require('which-key')

wk.add(
    { "<leader>f", group = "Find" },
    { "<leader>v", group = "View" },
    { "<leader>vc", group = "Code" },
    { "<leader>r", group = "run" },
    { "<leader>c", group = "Code" },
    { "<leader>ce", group = "Extract" },
    { "<leader>d", group = "Debug" },
    { "<leader>ds", group = "Step" },
    {"g", group = "Goto"}
)
