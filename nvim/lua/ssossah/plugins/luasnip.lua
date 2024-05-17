return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    build = "make install_jsregexp",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    init = function()
        local ls = require("luasnip")
        ls.setup({
            -- Required to automatically include base snippets, like "c" snippets for "cpp"
            load_ft_func = require("luasnip_snippets.common.snip_utils").load_ft_func,
            ft_func = require("luasnip_snippets.common.snip_utils").ft_func,
            -- To enable auto expansin
            enable_autosnippets = true,
            -- Uncomment to enable visual snippets triggered using <c-x>
            -- store_selection_keys = '<c-x>',
        })
        -- LuaSnip key bindings
        vim.keymap.set({ "i", "s" }, "<Tab>", function()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            else
                vim.api.nvim_input("<C-V><Tab>")
            end
        end, { silent = true })
        vim.keymap.set({"i"}, "<Tab>", function() if ls.expandable() then ls.expand() else vim.api.nvim_input('<C-V><Tab>') end end, {silent = true})
        vim.keymap.set({"i"}, "<C-K>", function() ls.jump(1) end, {silent = true})
        vim.keymap.set({"i"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
        vim.api.nvim_set_keymap("i", "<C-y>", "<Plug>luasnip-next-choice", {})
    end,
}