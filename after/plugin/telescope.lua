local telescope = require('telescope')
telescope.setup {
    pickers = {
        find_files = {
            hidden = true,
            file_ignore_patterns = { ".git/" },
        }
    },
    extensions = {
        ["ui-select"] = {require("telescope.themes").get_dropdown {}}
    }
}
telescope.load_extension("ui-select")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "Search Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = "Search Word" })
vim.keymap.set('n', '<leader>sG', builtin.git_commits, { desc = "Search Git commits" })
vim.keymap.set('n', '<leader>sbG', builtin.git_bcommits, { desc = "Search Git commits for current buffer" })
