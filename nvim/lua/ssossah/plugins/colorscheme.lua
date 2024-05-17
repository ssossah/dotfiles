return {
    "Mofiqul/vscode.nvim",
    version = "10.16.0",
    priority = 1000,

    -- optionally, override the default options:
    config = function()
        local c = require("vscode.colors").get_colors()
        require("vscode").setup({
            -- Alternatively set style in setup
            style = "dark",

            -- Enable transparent background
            transparent = true,

            -- Enable italic comment
            italic_comments = true,

            -- Disable nvim-tree background color
            disable_nvimtree_bg = true,

            -- Override colors (see ./lua/vscode/colors.lua)
            color_overrides = {
                vscLineNumber = "#FFFFFF",
            },

            -- Override highlight groups (see ./lua/vscode/theme.lua)
            group_overrides = {
                -- this supports the same val table as vim.api.nvim_set_hl
                -- use colors from this colorscheme by requiring vscode.colors!
                Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
            },
        })
        require("vscode").load()
    end,
}

-- return {
--     "ellisonleao/gruvbox.nvim",
--     priority = 1000,
--     config = function()
--         require("gruvbox").setup({
--             terminal_colors = true, -- add neovim terminal colors
--             undercurl = true,
--             underline = true,
--             bold = true,
--             italic = {
--                 strings = true,
--                 emphasis = true,
--                 comments = true,
--                 operators = false,
--                 folds = true,
--             },
--             strikethrough = true,
--             invert_selection = false,
--             invert_signs = false,
--             invert_tabline = false,
--             invert_intend_guides = false,
--             inverse = true, -- invert background for search, diffs, statuslines and errors
--             contrast = "", -- can be "hard", "soft" or empty string
--             palette_overrides = {},
--             overrides = {},
--             dim_inactive = false,
--             transparent_mode = true,
--         })
--         vim.o.background = "dark"
--         vim.cmd("colorscheme gruvbox")
--         require("gruvbox").load()
--     end,
-- }

-- colorschemes

-- catppuccin
-- onenord
-- vscode
-- solarized?
-- gruvbox
-- settings to change colorscheme for lua file
-- vim.cmd[[autocmd BufEnter,BufNewFile *.lua colo onenord]]
-- vim.cmd[[autocmd BufLeave  *.lua colo codedark]]
-- settings to change colorscheme for sql file
-- vim.cmd[[autocmd BufEnter,BufNewFile *.sql colo one]]
-- vim.cmd[[autocmd BufLeave  *.sql colo onenord]]

-- "rmehri01/onenord.nvim",
-- { "catppuccin/nvim", as="catppuccin" },
-- 'tomasiser/vim-code-dark',
-- "lewpoly/sherbet.nvim",
-- { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
-- "rakr/vim-one",
-- "habamax/vim-habamax",
-- 'morhetz/gruvbox',
-- 'shaunsingh/solarized.nvim',
-- "sainnhe/gruvbox-material",
-- "marko-cerovac/material.nvim",
-- 'Mofiqul/vscode.nvim',
-- "sainnhe/edge",
-- "jacoborus/tender.vim",
-- 'rose-pine/neovim',
-- "rebelot/kanagawa.nvim",
-- "EdenEast/nightfox.nvim",
-- "sainnhe/everforest",
-- "neanias/everforest-nvim",
-- "pbrisbin/vim-colors-off",
-- "kaiuri/nvim-juliana",
