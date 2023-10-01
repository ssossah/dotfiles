require("which-key").setup {
    plugins = {
        marks = true,                -- shows a list of your marks on ' and `
        registers = true,            -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                                     -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                                     -- No actual key bindings are created
        presets = {
            operators = false,       -- adds help for operators like d, y, ...
            motions = false,         -- adds help for motions
            text_objects = false,    -- help for text objects triggered after entering an operator
            windows = true,          -- default bindings on <c-w>
            nav = true,              -- misc bindings to work with windows
            z = true,                -- bindings for folds, spelling and others prefixed with z
            g = true                 -- bindings for prefixed with g
        }
    },
    icons = {
        breadcrumb = "»",            -- symbol used in the command line area that shows your active key combo
        separator = "➜",             -- symbol used between a key and it's label
        group = "+"                  -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = "<c-d>",       -- binding to scroll down inside the popup
        scroll_up = "<c-u>",         -- binding to scroll up inside the popup
      },
    window = {
        border = "single",           -- none, single, double, shadow
        position = "bottom",         -- bottom, top
        margin = {1, 0, 1, 0},       -- extra window margin [top, right, bottom, left]
        padding = {2, 2, 2, 2}       -- extra window padding [top, right, bottom, left]
    },
    layout = {
        height = {min = 4, max = 25},-- min and max height of the columns
        width = {min = 20, max = 50},-- min and max width of the columns
        spacing = 3                  -- spacing between columns
    },
    hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
    show_help = true,                -- show help message on the command line when the popup is visible
    -- triggers = {"<leader>"}
}

vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


map('n', '<C-h>', '<C-w>h', opts)                                               -- change panes on vim ctrl mappings
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('v', '<M-c>', '"+y', opts)                                                  -- copy and pasting
map("v", "<F3>", ":<c-u>HSHighlight 5<CR>", { noremap = true, silent = true })  -- highlighting notes mint green
map("v", "<F4>", ":<c-u>HSHighlight 10<CR>", { noremap = true, silent = true }) -- highlighting notes bright orange/yellow
map("v", "<F1>", ":<c-u>HSRmHighlight<CR>", { noremap = true, silent = true })  -- remove highlight
map('n', '<leader>n', ':NvimTreeToggle <CR>', { noremap = true })               -- file explorer
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)                              -- Barbar: Move to previous/next
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)                          -- Re-order to previous/next
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)                                -- Goto buffer in position...
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

local mappings = {
    ["<leader>f"] = {
            name = "Find",
            b  = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
            B  = {"<cmd>Telescope buffers<cr>", "Checkout branch"},
            c  = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
            f  = {"<cmd>Telescope find_files<cr>", "Find File"},
            h  = {"<cmd>Telescope help_tags<cr>", "Search Help Tags"},
            k  = {"<cmd>Telescope keymaps<cr>", "Find Keymaps"},
            m  = {"<cmd>Telescope marks<cr>", "Marks"},
            M  = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
            h  = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
            r  = {"<cmd>Telescope registers<cr>", "Find Registers"},
            w  = {"<cmd>Telescope live_grep<cr>", "Find Word"},
            i  = {"<cmd>Telescope highlights<cr>", "Find Word"},
        },
    ["<leader>n"] = {
            name = "Nvim Tree",
            f = {"<cmd>NvimTreeFocus<cr>", "Tree Focus"},
            s = {"<cmd>NvimTreeFindFile<cr>", "Tree Find File"},
            c = {"<cmd>NvimTreeCollapse<cr>", "Tree Collapse"},
            i = {"<cmd>Neorg workspace notes<cr>", "Navigate to neorg index"},
            r = {"<cmd>Neorg return<cr>", "Return from neorg to code"},
    },
    ["<leader>d"] = {
            name = "Debug",
            b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
            B = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Toggle UI" },
            c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
            C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
            d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
            g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
            i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
            o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
            p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
            q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
            r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
            s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
            t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
            u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
            U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
            x = { "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Toggle UI" },
            y = { "<cmd>lua require'dap'.run_last()<cr>", "Toggle UI" },
            z = { "<cmd>lua require'dap-python'.test_method()<cr>", "Toggle UI" },
          },
    ["<leader>b"] = {
            name = "Buffer Management/ Git Blame",
            d = { "<cmd>BufferOrderByDirectory<cr>", "Order buffer by directory" },          -- automatically sort by...
            l = { "<cmd>BufferOrderByLanguage<cr>", "Order buffer by language" },
            w = { "<cmd>BufferWipeout<cr>", "buffer wipeout" },
            p  = { "<cmd>BufferPin<cr>", "Pin Buffer" },                                     -- buffer close/pin...
            c  = { "<cmd>BufferClose<cr>", "Close Buffer" },
            C  = { "<cmd>BufferCloseAllButCurrent<cr>", "Keep only current buffer" },
            P  = { "<cmd>BufferCloseAllButPinned<cr>", "Keep only pinned buffer" },
            CP = { "<cmd>BufferCloseAllButCurrentOrPinned<cr>", "Keep current or pinned buffer" },
            l  = { "<cmd>BufferCloseBuffersRight<cr>", "Close buffers on right" },
            h  = { "<cmd>BufferCloseBuffersLeft<cr>", "Close buffers on left" },
            t  = { "<cmd>GitBlameToggle<cr>", "Git blame toggle" },
    },
    ["<leader>x"] = {
            name = "Database",
            n = { "<Cmd>DBUIToggle<Cr>", "Toggle UI" },
            f = { "<Cmd>DBUIFindBuffer<Cr>", "Find buffer" },
            r = { "<Cmd>DBUIRenameBuffer<Cr>", "Rename buffer" },
            q = { "<Cmd>DBUILastQueryInfo<Cr>", "Last query info" },
    },
    z = {
            name = "Insert line",
            j = {"o<Esc>", "insert new line below"},
            k = {"O<Esc>", "insert new line above"}
    },
    ["<leader>w"]  = {
            name = "Resize Window/Change Workspace",
            a = { "<cmd>WorkspacesOpen antilles<cr>", "open antilles workspace" },
            c = { "<cmd>WorkspacesOpen caliper-api<cr>", "open caliper api workspace" },
            n = { "<cmd>WorkspacesOpen notes<cr>", "open notes workspace" },
            t = { "<cmd>WorkspacesOpen training<cr>", "open caliper api workspace" },
            v = { "<cmd>WorkspacesOpen nvim<cr>", "open nvim configs workspace" },
            h = {"<cmd>vertical resize +5<cr>", "Increase vertical window size by 5"},
            l = {"<cmd>vertical resize -5<cr>", "Decrease vertical window size by 5"},
            k = {"<cmd>resize +5<cr>", "Increase window size by 5"},
            j = {"<cmd>resize -5<cr>", "Decrease window size by 5"},
    },
    ["<leader>q"]  = {
            name = "Quick Notes",
            q = {"<cmd>:lua require('quicknote').NewNoteAtCurrentLine()<cr>", "Create a note at current cursor line"},
            v = {"<cmd>:lua require('quicknote').ToggleNoteSigns()<cr>", "Note sign will appear on left handside"},
            e = {"<cmd>:lua require('quicknote').OpenNoteAtCurrentLine()<cr>", "Open note and allow for edit"},
            d = {"<cmd>:lua require('quicknote').DeleteNoteAtCurrentLine()<cr>", "Delete note at current line"},
            n = {"<cmd>:lua require('quicknote').JumpToNextNote()<cr>", "Jump to next note"},
            N = {"<cmd>:lua require('quicknote').JumpToPreviousNote()<cr>", "Jump to previous note"},
            V = {"<cmd>:lua require('quicknote').list all notes associated with current buffer()<cr>", "List all notes for current buffer"},

    },
    ["<leader>"]  = {
            name = "Calendar",
            cc = {"<cmd>Calendar -view=week<cr>", "open calendar"},
            c = {"<cmd>Calendar -view=week -split=horizontal -position=below -height=18<cr>", "open small calendar"},
            sh = {"<cmd>HSExport<cr>", "Save highlight"},
            ih = {"<cmd>HSImport<cr>", "Import highlight"},
        },
    ["<leader>p"]  = {
            name = "Packer Utilities",
            l = {"<cmd>luafile %<cr>", "save luafile"},
            p = {"<cmd>PackerSync<cr>", "packer sync"},
            c = {"<cmd>PackerClean<cr>", "packer clean"},
            u = {"<cmd>PackerUpdate<cr>", "packer update"},
        }
}

local wk = require("which-key")
wk.register(mappings)
