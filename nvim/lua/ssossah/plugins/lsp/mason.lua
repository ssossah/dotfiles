-- using mason.nvim to install the language servers that we need to enable lsp functionality for the languages used
return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- helps install other things that arent language servers
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "pyright",
                "lua_ls",
                "tailwindcss",
                "tsserver",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "ruff-lsp", -- @0.0.52
                "debugpy", -- nvim dap
                "rust-analyzer",
                "xmlformatter",
            },
        })
    end,
}
