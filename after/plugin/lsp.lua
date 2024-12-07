local lsp = require("lsp-zero").preset({})


local function search_up(dir_or_file)
    local found = nil
    local dir_to_check = nil
    -- get parent directory via vim expand
    local dir_template = "%:p:h"
    while not found and dir_to_check ~= "/" do
        dir_to_check = vim.fn.expand(dir_template)
        local check_path = dir_to_check .. "/" .. dir_or_file
        local check_git = dir_to_check .. "/" .. ".git"
        if vim.fn.isdirectory(check_path) == 1 or vim.fn.filereadable(check_path) == 1 then
            found = dir_to_check .. "/" .. dir_or_file
        else
            dir_template = dir_template .. ":h"
        end
        -- If we hit a .git directory then stop searching and return found even if nil
        if vim.fn.isdirectory(check_git) == 1 then
            return found
        end
    end
    return found
end

local function set_groovy_classpath()
    local Job = require("plenary.job")
    local gradle_dir = vim.fs.dirname(search_up("build.gradle"))
    vim.notify("groovyls: starting gradle dependencies install at: " .. gradle_dir, vim.log.levels.INFO)
    Job
        :new({
            command = "gradle-classpath",
            cwd = gradle_dir,
            on_exit = function(k, _)
                vim.schedule(function()
                    if k.code ~= 0 then
                        vim.notify("gradle-classpath: " .. vim.inspect(k._stderr_results),
                            vim.log.levels.ERROR)
                    else
                        local _classpath_results_stdout = k._stdout_results[1]
                        local classpath_results = vim.split(_classpath_results_stdout, ":")
                        vim.notify("Setting classpath in groovyls ...", vim.log.levels.INFO)
                        local groovy_lsp_client = vim.lsp.get_clients({ name = "groovyls" })[1]
                        if not groovy_lsp_client then
                            vim.notify("Error lsp client groovyls not found.", vim.log.levels.ERROR)
                            return
                        end
                        if groovy_lsp_client.settings then
                            groovy_lsp_client.settings = vim.tbl_deep_extend(
                                "force",
                                groovy_lsp_client.settings,
                                { groovy = { classpath = classpath_results } }
                            )
                        else
                            groovy_lsp_client.config.settings = vim.tbl_deep_extend(
                                "force",
                                groovy_lsp_client.config.settings,
                                { groovy = { classpath = classpath_results } }
                            )
                        end
                        groovy_lsp_client.notify(
                            "workspace/didChangeConfiguration",
                            { settings = groovy_lsp_client.settings }
                        )
                    end
                end)
            end,
        })
        :start()
end

lsp.ensure_installed({
    "lua_ls",
    "jdtls",
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, { buffer = bufnr, remap = false, desc = "Goto Definition" })
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "<leader>vws", function()
        vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set("n", "<leader>vd", function()
        vim.diagnostic.open_float()
    end, { buffer = bufnr, remap = false, desc = "view diagnostics" })
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, { buffer = bufnr, remap = false, desc = "View Code Actions" })
    vim.keymap.set("n", "<leader>vr", function()
        require("telescope.builtin").lsp_references()
    end, { buffer = bufnr, remap = false, desc = "View References" })
    vim.keymap.set("n", "<leader>cr", function()
        vim.lsp.buf.rename()
    end, { buffer = bufnr, remap = false, desc = "Code Rename" })
    vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set("n", "<leader>F", function()
        require("conform").format({ lsp_fallback = true })
    end, { desc = "Format" })
end)

lsp.skip_server_setup({ "jdtls" })
-- lsp.skip_server_setup({ "groovyls" })
-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
require("lspconfig").clangd.setup({})
require("lspconfig").groovyls.setup({
    on_attach = function(client, bufnr)
        -- on_attach(client, bufnr)
        set_groovy_classpath()
    end,
})
lsp.setup()
