return {
    "nvim-treesitter/nvim-treesitter-refactor",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
        local treesitter_configs = require('nvim-treesitter.configs')
        treesitter_configs.setup({
            refactor = {
                -- highlight_current_scope = { enable = true },
                highlight_definitions = {
                    enable = true,
                    -- set to false if you have update time of ~100
                    clear_on_cursor_move = true
                },
                smart_rename = {
                    enable = trie,
                    -- Assign keymaps to false to disable them, e.g. `smart_rename = false`
                    keymaps = {
                        smart_rename = "grr",
                    }
                },
                navigation = {
                    enable = true,
                     -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
                    keymaps = {
                        goto_definition = "gnd",
                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                        goto_next_usage = "<a-*>",
                        goto_previous_usage = "<a-#>",
                    },
                },
            }
        })
    end,
}
