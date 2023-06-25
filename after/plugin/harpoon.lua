require("telescope").load_extension('harpoon')

vim.keymap.set("n", "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", {desc = "Harpoon Add"})
vim.keymap.set("n", "<leader><Space>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", {desc = "Harpoon"})
vim.keymap.set("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", {desc = "Buff 1"})
vim.keymap.set("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", {desc = "Buff 2"})
vim.keymap.set("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", {desc = "Buff 3"})
vim.keymap.set("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", {desc = "Buff 4"})

