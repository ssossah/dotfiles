require("packer").startup(function(use)
	use({"wbthomason/packer.nvim", --  packer can manage itself

        -- colorscheme
        "rmehri01/onenord.nvim",
        { "catppuccin/nvim", as="catppuccin" },

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

        -- COC
		{ "neoclide/coc.nvim", branch = "release" },                                                        -- (ruff, sql, json, pyright, db)

        "folke/which-key.nvim",                                                                             -- displays popup of possible key bindings
		"xiyaowong/transparent.nvim",                                                                       -- changes background to transparent
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
        ({ "iamcco/markdown-preview.nvim", run = function() vim.fn["mkdp#util#install"]() end, }),          -- markdown preview
        { "Wansmer/treesj", config = function() require("treesj").setup({}) end },                          -- used to expand/ narrow arrays and lists
        { "lewis6991/gitsigns.nvim", config = function() require("gitsigns").setup({}) end },               -- super fast git decorations
        { "fei6409/log-highlight.nvim", config = function() require("log-highlight").setup {} end,},        -- logging support
		{ "natecraddock/workspaces.nvim", config = function() require("workspaces").setup() end },          -- easy workspace navigation & search
		{ "nvim-neorg/neorg", run = ":Neorg sync-parsers" },                                                -- notes
		{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },                                           -- syntax highlighting
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },                                       -- FZF fuzzy file finder
		{ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } },                    -- content fuzzy finder
		{ "cappyzawa/trim.nvim", config = function() require("trim").setup({}) end },                       -- improved whitespace handling
		{ "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup({}) end },           -- matching delimiters
		{ "numToStr/Comment.nvim", config = function() require("Comment").setup() end },                    -- commentary support
        { "nvim-tree/nvim-web-devicons", config = function() require("nvim-web-devicons").setup({}) end },  -- cool icons
        -- "kevinhwang91/nvim-bqf",                                                                         -- allows you to search quick fix list more easily
    })

	if packer_bootstrap then require("packer").sync() end
end)