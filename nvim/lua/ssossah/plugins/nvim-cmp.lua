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

-- return {
--     "hrsh7th/nvim-cmp",
--     event = "InsertEnter",
--     dependencies = {
--         "hrsh7th/cmp-buffer", -- source for text in buffer
--         "hrsh7th/cmp-path", -- source for file system paths
--         {
--             "L3MON4D3/LuaSnip",
--             version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--             -- install jsregexp (optional!).
--             build = "make install_jsregexp",
--         },
--         "saadparwaiz1/cmp_luasnip", -- completion source for luasnip
--         -- "rafamadriz/friendly-snippets", -- usefclassnippets for different languages
--         "onsails/lspkind.nvim", -- vs-code like pictograms
--     },
--     config = function()
--         local cmp = require("cmp")
--         local luasnip = require("luasnip")
--         local lspkind = require("lspkind")
--
--         -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
--         require("luasnip.loaders.from_vscode").lazy_load()
--
--         local function tab(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             -- elseif luasnip.expand_or_jumpable() then
--             --     luasnip.expand_or_jump()
--             else
--                 fallback()
--             end
--         end
--
--         local function shift_tab(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             -- elseif luasnip.jumpable(-1) then
--             --     luasnip.jump(-1)
--             else
--                 fallback()
--             end
--         end
--
--         cmp.setup({
--             completion = {
--                 completeopt = "menu,menuone,preview,noselect",
--             },
--             snippet = { -- configure how nvim-cmp interacts with snippet engine
--                 expand = function(args)
--                     luasnip.lsp_expand(args.body)
--                 end,
--             },
--
--             mapping = cmp.mapping.preset.insert({
--                 ["<Tab>"] = cmp.mapping(tab, { "i", "s" }),
--                 ["<S-Tab>"] = cmp.mapping(shift_tab, { "i", "s" }),
--                 ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--                 ["<C-f>"] = cmp.mapping.scroll_docs(4),
--                 ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
--                 ["<C-e>"] = cmp.mapping.abort(), -- close completion window
--                 ["<CR>"] = cmp.mapping.confirm({ select = false }),
--             }),
--             -- sources for autocompletion
--             sources = cmp.config.sources({
--                 { name = "nvim_lsp" },
--                 { name = "luasnip" }, -- snippets
--                 { name = "buffer" }, -- text within current buffer
--                 { name = "path" }, -- file system paths
--             }),
--
--             -- configure lspkind for vs-code like pictograms in completion menu
--             formatting = {
--                 format = lspkind.cmp_format({
--                     maxwidth = 50,
--                     ellipsis_char = "...",
--                 }),
--             },
--         })
--     end,
-- }
