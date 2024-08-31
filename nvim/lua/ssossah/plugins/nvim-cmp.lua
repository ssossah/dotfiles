return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
            -- install jsregexp (optional!).
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- completion source for luasnip
        -- "rafamadriz/friendly-snippets", -- usefclassnippets for different languages
        "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")
         -- sorts completion suggestion by public/private functions first
        local visibility = function(entry1, entry2)
            -- check the current filetype to only apply to python files
            local filetype = vim.bo.filetype
            if filetype ~= 'python' then
                -- if not Python, do not change sorting order
                return nil
            end

            --function to check if entry is private (starts with _)
            local function is_private(entry)
                local label = entry.completion_item.label
                return label:sub(1, 1) == '_'
            end

            -- compare entries: prioritize public functions over private
            local entry1_private = is_private(entry1)
            local entry2_private = is_private(entry2)

            if entry1_private and not entry2_private then
                return false
            elseif not entry1_private and entry2_private then
                return true
            end

            -- if both are private or both are public, fall back to other comparators
            return nil
        end

        local variable = function(entry1, entry2)
            -- function to check if an entry is a variable
            local function is_variable(entry)
                local kind = entry.completion_item.kind
                return kind == cmp.lsp.CompletionItemKind.Variable
            end

            local entry1_variable = is_variable(entry1)
            local entry2_variable = is_variable(entry2)

            if entry1_variable and not entry2_variable then
                return true
            elseif entry2_variable and not entry1_variable then
                return false
            end

            return nil
        end

        local method = function(entry1, entry2)
            -- function to check if an entry is a function
            local function is_method(entry)
                local kind = entry.completion_item.kind
                return kind == cmp.lsp.CompletionItemKind.Function or kind == cmp.lsp.CompletionItemKind.Method
            end

            local entry1_method = is_method(entry1)
            local entry2_method = is_method(entry2)

            if entry1_method and not entry2_method then
                return false
            elseif entry2_method and not entry1_method then
                return true
            end

            return nil
        end

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = function()
                    if cmp.visible() then
                        cmp.select_next_item()
                    else
                        fallback()
                    end
                end,
                -- ["<S-Tab>"] = cmp.mapping(shift_tab, { "i", "s" }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            -- sources for autocompletion
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- snippets
                { name = "buffer" }, -- text within current buffer
                { name = "path" }, -- file system paths
            }),
            -- sorting = {
            --     comparators = {
            --         compare.exact,
            --         -- visibility,
            --         compare.kind
            --     }
            -- }
            --
            sorting = {
                comparators = {
                    cmp.config.compare.recently_used,
                    cmp.config.compare.locality,
                    visibility,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                    variable,
                    method
                },
            },

            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
                format = lspkind.cmp_format({
                    maxwidth = 50,
                    ellipsis_char = "...",
                }),
            },
        })
    end,
}
