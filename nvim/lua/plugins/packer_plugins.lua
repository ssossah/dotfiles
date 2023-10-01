require("packer").startup(function(use)
	use({"wbthomason/packer.nvim", --  packer can manage itself

        -- colorscheme
        "rmehri01/onenord.nvim",
        { "catppuccin/nvim", as="catppuccin" },
        "Mofiqul/vscode.nvim",

        -- debugging
        "mfussenegger/nvim-dap-python",
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",

        -- database
        { "tpope/vim-dadbod",
          opt = true,
          requires = {
              "kristijanhusak/vim-dadbod-ui",
              "kristijanhusak/vim-dadbod-completion",
          },
          config = function()
            require("dadbod").setup()
          end,
          cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
        },

        "Pocco81/HighStr.nvim",                                                                             -- highlight words/sentences
	    { "neoclide/coc.nvim", branch = "release" },                                                        -- (ruff, sql, json, pyright, db)
        "tpope/vim-speeddating",                                                                            -- incrementing numbers and dates
        -- "3rd/image.nvim",                                                                                   -- display images in neorg
        "folke/which-key.nvim",                                                                             -- displays popup of possible key bindings
        {"itchyny/calendar.vim"},                                                                           -- keep track of dates, tasks, and events
        "folke/twilight.nvim",                                                                              -- dims inactive code
		-- "xiyaowong/transparent.nvim",                                                                       -- changes background to transparent
        "rcarriga/nvim-notify",                                                                             -- notification manager
        "f-person/git-blame.nvim",                                                                          -- history on git author and pr access
        "AndrewRadev/splitjoin.vim",                                                                        -- creates folds within code
		"tpope/vim-surround",                                                                               -- add, delete, change surrounding pairs
		"tpope/vim-fugitive",                                                                               -- git wrapper
		"hoob3rt/lualine.nvim",                                                                             -- status line
		"airblade/vim-gitgutter",                                                                           -- shows which lines have been added, moved, removed
        "romgrk/barbar.nvim",                                                                               -- adding tabs
        "goolord/alpha-nvim",                                                                               -- cool startup screen
		"nvim-tree/nvim-tree.lua",                                                                          -- file explorer
        { "RutaTang/quicknote.nvim", config = function()                                                    -- quick notes to code
            require("quicknote").setup({ mode = "portable", sign = "N", filetype = "python", git_branch_recognizable = true, }) end },
        { "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, },            -- markdown preview
        { "Wansmer/treesj", config = function() require("treesj").setup({}) end },                          -- used to expand/ narrow arrays and lists
        { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup({}) end },               -- super fast git decorations
        { "fei6409/log-highlight.nvim", config = function() require("log-highlight").setup {} end,},        -- logging support
		{ "natecraddock/workspaces.nvim", config = function() require("workspaces").setup() end },          -- easy workspace navigation & search
		{ "nvim-neorg/neorg", run = ":Neorg sync-parsers" },                                                -- notes
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },                                           -- syntax highlighting
		 "nvim-treesitter/playground",                                                                      -- syntax highlighting
        { "lukas-reineke/headlines.nvim",                                                                   -- adds highlights for Neorg and markdown (loading in its own .lua file doesnt work for some reason)
            ft = { "markdown", "org", "norg" },
            after = 'nvim-treesitter',
            config = function()
                require('headlines').setup(
                {
                    norg = {
                        -- headline_highlights = { "Headline1", "Headline2" },
                        bullets = {},
                        fat_headline_lower_string = "▀",
                    },
                }
                )
            end,
        },
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },                                       -- FZF fuzzy file finder
		{ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } },                    -- content fuzzy finder
		{ "cappyzawa/trim.nvim", config = function() require("trim").setup({}) end },                       -- improved whitespace handling
		{ "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({}) end },           -- matching delimiters
		{ "numToStr/Comment.nvim", config = function() require("Comment").setup() end },                    -- commentary support
        { "nvim-tree/nvim-web-devicons", config = function() require("nvim-web-devicons").setup({
        override_by_filename = {
            [".gitignore"] = {
                icon = "",
            }
        }
        }) end },  -- cool icons
        -- "kevinhwang91/nvim-bqf",                                                                         -- allows you to search quick fix list more easily
        -- "GCBallesteros/NotebookNavigator.nvim" -- some sort of jupiter notebook... checkout later
    })

	if packer_bootstrap then require("packer").sync() end
end)
