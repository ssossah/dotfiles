return {
    "folke/which-key.nvim", -- key bindings
    event = "VeryLazy",
    config = function()
        require("which-key").setup({
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false, -- adds help for operators like d, y, ...
                    motions = false, -- adds help for motionselelee
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = true, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>", -- binding to scroll up inside the popup
            },
            window = {
                border = "single", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
            },
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
            show_help = true, -- show help message on the command line when the popup is visible
            -- triggers = {"<leader>"}
        })

        vim.g.mapleader = " "
        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- move tabs left/right
        map("n", "<A->>", "<Cmd>BufferLineMoveNext<CR>", opts)
        map("n", "<A-<>", "<Cmd>BufferLineMovePrev<CR>", opts)

        -- move between tabs
        map("n", "<A-.>", "<Cmd>BufferLineCycleNext<CR>", opts)
        map("n", "<A-,>", "<Cmd>BufferLineCyclePrev<CR>", opts)

        -- go to specific buffer
        map("n", "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", opts)
        map("n", "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", opts)
        map("n", "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", opts)
        map("n", "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", opts)
        map("n", "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", opts)
        map("n", "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", opts)
        map("n", "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", opts)
        map("n", "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", opts)

        local mappings = {
            ["<leader>s"] = {
                name = "Splitting Windows",
                v = { "<C-w>v", "Split window vertically" },
                h = { "<C-w>s", "Split window horizontally" },
                e = { "<C-w>=", "Make split window equal in size" },
                x = { "<cmd>close<CR>", "Close current split window" },
            },
            ["<leader>f"] = {
                name = "Find",
                a = { "<cmd>Telescope quickfix<cr>", "Toggle quickfix list" },
                b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
                B = { "<cmd>Telescope buffers<cr>", "Checkout branch" },
                c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
                f = { "<cmd>Telescope find_files<cr>", "Find File" },
                g = { "<cmd>Telescope help_tags<cr>", "Search Help Tags" },
                k = { "<cmd>Telescope keymaps<cr>", "Find Keymaps" },
                m = { "<cmd>Telescope marks<cr>", "Marks" },
                M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
                h = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                r = { "<cmd>Telescope registers<cr>", "Find Registers" },
                w = { "<cmd>Telescope live_grep<cr>", "Find Word" },
                i = { "<cmd>Telescope highlights<cr>", "Find Word" },
                t = { "<cmd>TodoTelescope<cr>", "Find todos" },
            },
            ["<leader>n"] = {
                name = "Nvim Tree",
                f = { "<cmd>NvimTreeFocus<cr>", "Tree Focus" },
                s = { "<cmd>NvimTreeFindFile<cr>", "Tree Find File" },
                c = { "<cmd>NvimTreeCollapse<cr>", "Tree Collapse" },
                l = { "<cmd>NvimTreeRefresh<cr>", "Tree Refresh" },
                i = { "<cmd>Neorg workspace notes<cr>", "Navigate to neorg index" },
                r = { "<cmd>Neorg return<cr>", "Return from neorg to code" },
            },
            ["<leader>d"] = {
                name = "Debug",
                b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
                B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Toggle UI" },
                c = { "<cmd>lua require'dap'.continue()<cr>", "Start or Continue" },
                C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
                d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
                g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
                i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
                o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
                p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
                q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
                r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
                t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
                U = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
                u = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
                x = {
                    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
                    "Toggle UI",
                },
                y = { "<cmd>lua require'dap'.run_last()<cr>", "Toggle UI" },
                z = { "<cmd>lua require'dap-python'.test_method()<cr>", "Toggle UI" },
            },
            ["<leader>b"] = {
                name = "Buffer Management/ Git Blame",
                C = { "<cmd>BufferLineCloseOthers<cr>", "Keep only current buffer" },
                l = { "<cmd>BufferLineCloseRight<cr>", "Close buffers on right" },
                h = { "<cmd>BufferLineCloseLeft<cr>", "Close buffers on left" },
                m = { "<cmd>BufferLinePick<cr>", "Select a buffer to navigate to" },
                c = { "<cmd>BufferLinePickClose<cr>", "Select a buffer to close" },
                t = { "<cmd>GitBlameToggle<cr>", "Blame toggle" },
                b = { "<cmd>GitBlameOpenCommitURL<cr>", "Blame open commit url" },
            },
            ["<leader>x"] = {
                name = "Database and Trouble",
                n = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
                f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
                r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
                q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },

                x = { "<cmd>TroubleToggle<CR>", "Open/close trouble list" },
                w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Open trouble workspace diagnostics" },
                d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Open trouble document diagnostics" },
                a = { "<cmd>TroubleToggle quickfix<CR>", "Open trouble quickfix list" },
                l = { "<cmd>TroubleToggle loclist<CR>", "Open trouble location list" },
                t = { "<cmd>TodoTrouble<CR>", "Open todos in trouble" },
            },
            z = {
                name = "Insert line",
                j = { "o<Esc>", "insert new line below" },
                k = { "O<Esc>", "insert new line above" },
            },
            ["<leader>w"] = {
                name = "Resize Window/Change Workspace",
                a = { "<cmd>WorkspacesOpen antilles<cr>", "open antilles workspace" },
                c = { "<cmd>WorkspacesOpen caliper-api<cr>", "open caliper api workspace" },
                n = { "<cmd>WorkspacesOpen notes<cr>", "open notes workspace" },
                t = { "<cmd>WorkspacesOpen training<cr>", "open caliper api workspace" },
                v = { "<cmd>WorkspacesOpen nvim<cr>", "open nvim configs workspace" },
                d = { "<cmd>WorkspacesOpen dbm<cr>", "open nvim configs workspace" },
                h = { "<cmd>vertical resize +5<cr>", "Increase vertical window size by 5" },
                l = { "<cmd>vertical resize -5<cr>", "Decrease vertical window size by 5" },
                k = { "<cmd>resize +5<cr>", "Increase window size by 5" },
                j = { "<cmd>resize -5<cr>", "Decrease window size by 5" },
                r = { "<cmd>SessionRestore<cr>", "Restore session for cwd" },
                s = { "<cmd>SessionSave<cr>", "Save session for auto session root dir" },
            },
            ["<leader>t"] = {
                name = "Tagbar and TabManagement",
                t = { "<cmd>TagbarToggle<cr>", "Toggle list of classes, functions, etc " },
                tn = { "<cmd>TagbarJumpNext<cr>", "Jump to next tag" },
                tp = { "<cmd>TagbarJumpPrev<cr>", "Jump to previous tag" },
                o = { "<cmd>tabnew<CR>", "Open new tab" },
                x = { "<cmd>tabclose<CR>", "Close current tab" },
                f = { "<cmd>tabnew %<CR>", "Open current buffer in new tab" },
                n = { "<cmd>tabNext<CR>", "Move to next buffer" },
                p = { "<cmd>tabprevious<CR>", "Move to previous buffer" },
            },
            ["<leader>"] = {
                name = "Lazy Options",
                l = { "<cmd>Lazy<cr>", "Toggle Lazy window" },
                a = { "<cmd>Alpha<cr>", "Invoke Alpha" },
                c = { "<cmd>Mason<cr>", "Invoke Mason" },
                p = { "<cmd>Neorg workspace codes<cr>", "Invoke Codes (passwords)" },
            },
        }

        local wk = require("which-key")
        wk.register(mappings)
    end,
}
