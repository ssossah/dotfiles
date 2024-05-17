return {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false,
    version = "*",
    -- build = ":Neorg sync-parsers",
    -- version = "v7.0.0", -- version pinning in case migration doesn't work
    config = function()
        require('neorg').setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {
                    config = {
                        -- folds = false,
                        foldlevelstart=99,
                        -- icon_preset = "default",
                        markup_preset = "brave",
                    }
                },
                ["core.dirman"] = {     -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes",
                            codes = "~/notes/sdk/notes/codes"
                        },
                    },
                },
                ["core.keybinds"] = {
                    config = {
                        -- default_keybinds = tue,
                    },
                },
                ["core.ui"] = { },
                ["core.qol.toc"] = { },
                ["core.integrations.treesitter"] = { },
                -- ["core.esupports.indent"] = {
                --     config = {
                --         tweaks = {
                --             heading2 = 3,
                --             heading3 = 3,
                --             heading4 = 6,
                --             heading5 = 8,
                --             heading6 = 10,
                --         }
                --     }
                -- }
            },
        }
    end,
}
