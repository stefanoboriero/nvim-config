vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and kind == 'update' then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter',
    'https://github.com/nvim-treesitter/nvim-treesitter-textobjects',
})

require('nvim-treesitter').setup {
    theme = "gruvbox",
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "java", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

require('nvim-treesitter').install({'lua', 'java', 'go', 'groovy'})

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = { 'lua' },
--   callback = function() vim.treesitter.start() end,
-- })

require('nvim-treesitter-textobjects').setup{
    select = {
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,

        selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
        },
    },
    move = {
        set_jumps = true,
    },
}

-- Selection keymaps
-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ "x", "o" }, "af", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@function.outer", "textobjects")
end, {desc = "Select around function"})
vim.keymap.set({ "x", "o" }, "if", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@function.inner", "textobjects")
end, {desc = "Select inside function"})
vim.keymap.set({ "x", "o" }, "ac", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@class.outer", "textobjects")
end, {desc = "Select around class"})
vim.keymap.set({ "x", "o" }, "ic", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@class.inner", "textobjects")
end, {desc = "Select inside class"})
vim.keymap.set({ "x", "o" }, "al", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@loop.outer", "textobjects")
end, {desc = "Select around loop"})
vim.keymap.set({ "x", "o" }, "il", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@loop.inner", "textobjects")
end, {desc = "Select inside loop"})
vim.keymap.set({ "x", "o" }, "aa", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@parameter.outer", "textobjects")
end, {desc = "Select around parameter"})
vim.keymap.set({ "x", "o" }, "ia", function()
  require('nvim-treesitter-textobjects.select').select_textobject("@parameter.inner", "textobjects")
end, {desc = "Select inside parameter"})

-- Move keymaps
-- You can use the capture groups defined in `textobjects.scm`
vim.keymap.set({ "n", "x", "o" }, "]m", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
end, {desc = "Next function start"})
vim.keymap.set({ "n", "x", "o" }, "]]", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
end, {desc = "Next class start"})
vim.keymap.set({ "n", "x", "o" }, "]o", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects")
end, {desc = "Next loop start"})
-- You can also use captures from other query groups like `locals.scm` or `folds.scm`
vim.keymap.set({ "n", "x", "o" }, "]s", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals")
end, {desc = "Next locals start"})
vim.keymap.set({ "n", "x", "o" }, "]z", function()
  require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds")
end, {desc = "Next fold start"})

vim.keymap.set({ "n", "x", "o" }, "]M", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
end, {desc = "Next function end"})
vim.keymap.set({ "n", "x", "o" }, "][", function()
  require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
end, {desc = "Next class end"})

vim.keymap.set({ "n", "x", "o" }, "[m", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
end, {desc = "Previous function start"})
vim.keymap.set({ "n", "x", "o" }, "[[", function()
  require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
end, {desc = "Previous class start"})

vim.keymap.set({ "n", "x", "o" }, "[M", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
end, {desc = "Previous function end"})
vim.keymap.set({ "n", "x", "o" }, "[]", function()
  require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
end, {desc = "Previous class start"})

-- Go to either the start or the end, whichever is closer.
-- Use if you want more granular movements
vim.keymap.set({ "n", "x", "o" }, "]d", function()
  require("nvim-treesitter-textobjects.move").goto_next("@conditional.outer", "textobjects")
end)
vim.keymap.set({ "n", "x", "o" }, "[d", function()
  require("nvim-treesitter-textobjects.move").goto_previous("@conditional.outer", "textobjects")
end)

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- Swap keymaps
vim.keymap.set("n", "<leader>a", function()
  require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner"
end, {desc = "Swap next"})
vim.keymap.set("n", "<leader>A", function()
  require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer"
end, {desc = "Swap previous"})
