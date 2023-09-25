require'nvim-treesitter.configs'.setup {
  theme = "monokaipro",
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

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["aa"] = { query = "@parameter.outer", desc = "Select around parameter"},
        ["ia"] = { query = "@parameter.inner", desc = "Select inside parameter"},
        ["af"] = { query = "@function.outer", desc = "Select around function"},
        ["if"] = { query = "@function.inner", desc = "Select inside function"},
        ["ac"] = { query = "@class.outer", desc = "Select around class"},
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["ai"] = { query = "@conditional.outer", desc = "Select around conditional"},
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional region" },
        ["al"] = { query = "@loop.outer", desc = "Select around loop"},
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop region" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
    },
    move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
            [']m'] = "@function.outer",
            [']]'] = "@class.outer",
        },
        goto_next_end = {
            [']M'] = "@function.outer",
            [']['] = "@class.outer",
        },
        goto_previous_start = {
            ['[m'] = "@function.outer",
            ['[['] = "@class.outer",
        },
        goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
        },
    },
    swap = {
        enable = true,
        swap_next = {
            ['<leader>n'] = "@parameter.inner"
        },
        swap_previous = {
            ['<leader>N'] = "@parameter.inner"
        },
    },
  },
}

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
