require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
            config = {
                -- folds = false,
                foldlevelstart=99,
                icon_preset = "diamond",
                markup_preset = "brave",
            }
        },
        ["core.dirman"] = {     -- Manages Neorg workspaces
            config = {
                workspaces = {
                    nav_guides = "~/Desktop/notes/nav_guides",
                    q2 = "~/Desktop/notes/sdk_guides/q2",
                    learning = "~/Desktop/notes/sdk_guides/learning",
                    daily = "~/Desktop/notes",
                },
            },
        },
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
            },
        },
        ["core.ui"] = { },
        ["core.qol.toc"] = { },
        ["core.integrations.treesitter"] = { },
    },
}
