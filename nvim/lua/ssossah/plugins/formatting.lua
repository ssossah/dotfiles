-- formatting
return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                python = { "ruff-lsp" },
                lua = { "stylua" },
                markdown = { "prettier" },
                yaml = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                javascript = { "prettier" },
                json = {"prettier"}
            },
            -- },
        })

        local function format_file()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end

        local function organize_imports()
            vim.lsp.buf.code_action({
                context = { only = { "source.organizeImports" } },
                apply = true,
            })
            vim.wait(100)
        end

        vim.api.nvim_create_user_command("Format", format_file, {})
        vim.api.nvim_create_user_command("OR", organize_imports, {})
    end,
}


-- -- format on save
-- format_on_save = {
--     lsp_fallback = true,
--     async = false,
--     timeout_ms = 1000,

-- -- organize imports on save
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     buffer = buffer,
--     callback = function()
--         vim.lsp.buf.code_action({
--             context = { only = { "source.organizeImports" } },
--             apply = true,
--         })
--         vim.wait(100)
--     end,
-- })
