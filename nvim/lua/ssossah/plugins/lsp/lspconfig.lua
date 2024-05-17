-- plugin we are going to use to configure our language servers
return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- integrate autocompletion with the language servers
        "antosha417/nvim-lsp-file-operations", -- add some nice functionality (e.g. modifying imports when a file has been renamed)
        { "folke/neodev.nvim", opts = {} }, -- add improved lsp functionality for the lua language server when working with neovim config
    },

    config = function()
        -- import lspconfig plugin
        local lspconfig = require("lspconfig")

        -- import mason_lspconfig plugin
        local mason_lspconfig = require("mason-lspconfig")

        -- import cmp-nvim-lsp plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        -- autocommands used to settup some logic to execute automatically on a specific event.
        -- Use LspAttach to execute this logic whenever an lsp client attaches to a buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local opts = { buffer = ev.buf, silent = true }

                -- set keybinds
                opts.desc = "Show LSP references"
                keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
            end,
        })

        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Change the diagnostic symbols in the sign column (gutter)
        local signs = { Error = " ", Warn = " ", Hint = "", Info = " " } -- hint 󰠠
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            -- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local util = require("lspconfig/util")
        local path = util.path
        local function get_python_path(workspace)
            -- use activated virtual env
            if vim.env.VIRTUAL_ENV then
                local end_result = path.join(vim.env.VIRTUAL_ENV, "bin", "python")
                require("notify")("Virtual env is activated")
                return end_result
            end
            -- Find and use virtualenv in workspace directory
            require("notify")("virtual env is not activated... Attempting to activate")
            for _, pattern in ipairs({ "*", ".*" }) do
                local match = vim.fn.glob(path.join(workspace, pattern, "pyenvcfg"))
                if match ~= "" then
                    return path.join(path.dirname(match), "bin", "python")
                end
            end
        end
        local on_attach = function(client)
            if client.name == "ruff_lsp" then
                -- Disable hover in favor of Pyright
                client.server_capabilities.hoverProvider = false
            end
        end

        -- configure lsp language servers in a specific way
        mason_lspconfig.setup_handlers({
            -- default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            -- ["rust-analyzer"] = function()
            --     lspconfig["rust-analyzer"].setup({
            --         -- server specific settings. See `:help lspconfig-setup`
            --         capabilities = capabilities,
            --         settings = {
            --             ['rust-analyzer'] = {},
            --         }
            --     })
            -- end,
            ["pyright"] = function()
                -- local util = require("lspconfig/util")
                -- local path = util.path
                lspconfig["pyright"].setup({
                    -- server specific settings. See `:help lspconfig-setup`
                    capabilities = capabilities,
                    settings = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                        python = {
                            analysis = {
                                -- -- Ignore all files for analysis to exclusively use Ruff for linting
                                -- ignore = { "*" },
                                diagnosticMode = "workspace",
                                typeCheckingMode = "basic",
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticSeverityOverrides = {
                                    reportGeneralTypeIssues = "none",
                                    reportOptionalMemberAccess = "none",
                                    reportOptionalOperand = "none",
                                    reportOptionalSubscript = "none",
                                    reportWildcardImportFromLibrary = "none",
                                },
                            },
                        },
                    },
                    before_init = function(_, config)
                        -- default_venv_path = path.join(vim.env.HOME, "Code", "antilles", ".env", "bin", "python")
                        -- config.settings.python.pythonPath = path.join(vim.env.HOME, "Code", "antilles", ".env", "bin", "python")
                        -- -- config.settings.python.pythonPath = default_venv_path
                        -- require('notify')(default_venv_path)
                        config.settings.python.pythonPath = get_python_path(config.root_dir)
                    end,
                })
            end,
            ["lua_ls"] = function()
                -- configure lua server (with special settings)
                lspconfig["lua_ls"].setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            -- make language server recognize "vim" global
                            diagnostics = {
                                globals = { "vim" },
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
            end,
            ["ruff_lsp"] = function()
                lspconfig["ruff_lsp"].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    init_options = {
                        args = {
                            "--config",
                            vim.fn.expand("$HOME/.config/format-lint/.ruff.toml"),
                        },
                        settings = {
                            format = { args = { "--preview" } },
                            lint = { args = { "--preview" } },
                        },
                        -- commands = {
                        --     RuffOrganizeImports = {
                        --         function()
                        --             local params = {
                        --                 command = "ruff.applyOrganizeImports",
                        --                 arguments = { vim.api.nvim_buf_get_name(0) },
                        --             }
                        --             vim.lsp.buf.execute_command(params)
                        --         end,
                        --         description = "Organize Imports"
                        --     }
                        -- }
                    },
                })
            end,
        })

        require("lspconfig").rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    cargo = {
                        buildScripts = {
                            enable = true,
                        },
                        extraArgs = { "--target-dir=target/analyzer" },
                    },
                    procMacro = {
                        enable = true,
                    },
                    server = {
                        extraEnv = { CARGO_TARGET_DIR = "target/analyzer" },
                    },
                    check = {
                        command = "clippy",
                    },
                },
            },
        })

    end,
}
