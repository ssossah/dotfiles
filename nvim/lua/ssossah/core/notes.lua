-- contains code and notes to reference when needed


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
-- "morhetz/gruvbox",
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


-- other init lua configs
--
---- Highlight on yank
--vim.cmd([[
-- augroup YankHighlight
--   autocmd!
--   autocmd TextYankPost * silent! lua vim.highlight.on_yank()
-- augroup end
--]])

---- --headlines
---- vim.cmd [[highlight Headline1 guibg=#1f2529]] -- #101214 #1f2529 #1c1c1c #262f36
---- -- vim.cmd [[highlight Headline2 guibg=#1f2529]] -- #36454f
---- vim.cmd [[highlight Headline2 guibg=#375f6b]]
---- vim.cmd [[highlight Headline3 guibg=None]]
---- vim.cmd [[highlight CodeBlock guibg=#1c1c1c]] --
---- vim.cmd [[highlight Dash guibg=None gui=bold]]

----neorg
---- vim.cmd [[highlight @attribute guifg=#ebcb8b]]
---- vim.cmd [[highlight @label guifg=#88c0d0]]
---- vim.cmd [[highlight @constant guifg=#b988b0]]
----vscode colorscheme
---- vim.cmd [[highlight @field guifg=#ffffff]]
---- vim.cmd [[highlight @constant guifg=#ffffff]]
---- vim.cmd [[highlight @method.call guifg=#ffffff]]
----
---- -- vim.cmd [[highlight Headline2 guibg=#375f6b]]
---- -- vim.cmd [[highlight @label guifg=#67c5e0]]




--checkout later
    -- "GCBallesteros/NotebookNavigator.nvim" -- some sort of jupiter notebook... checkout later
    -- "kevinhwang91/nvim-bqf",                                                                         -- allows you to search quick fix list more easily
--     "Tastyep/structlog.nvim",


-- remaining configs
-- return {
--
--         -- -- -- debugging
--         -- -- "mfussenegger/nvim-dap-python",
--         -- -- "mfussenegger/nvim-dap",
--         -- -- "rcarriga/nvim-dap-ui",
--         -- -- "theHamsta/nvim-dap-virtual-text",
--         --
--
--         -- "Pocco81/HighStr.nvim",                                                                             -- highlight words/sentences
--         -- 'stsewd/sphinx.nvim',                                                                               -- sphinx
-- 	    -- { "neoclide/coc.nvim", branch = "release" },                                                        -- (ruff, sql, json, pyright, db)
--         -- "3rd/image.nvim",                                                                                -- display images in neorg
--
--
--         -- "AndrewRadev/splitjoin.vim",                                                                        -- creates folds within code
--     }

-- remaining plugin files
-- coc.lua, highilght_line, image, nvim_dap, splitjoin
