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
                    notes = "~/notes"
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
