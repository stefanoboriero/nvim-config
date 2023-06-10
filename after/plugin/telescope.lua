local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc="Find Files"})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {desc="Search Grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc="Find Buffers"})
vim.keymap.set('n', '<leader>sw', builtin.grep_string, {desc="Search Word"})

