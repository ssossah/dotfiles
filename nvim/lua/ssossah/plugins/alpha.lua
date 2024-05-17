--header
local function header()
    local version_info = vim.version()
    local version = "   v" .. version_info.major .. "." .. version_info.minor .. "." .. version_info.patch

    local datetime = "  " .. tostring(os.date("%Y/%m/%d %H:%M:%S"))

    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    local plugins = "  ⚡" .. stats.count .. " neovim plugins loaded in " .. ms .. "ms"

    local basic_info = datetime .. version .. plugins
    local deco = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        basic_info
    }
    return deco
end

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("w", "󰈞  Find word", ":Telescope live_grep <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("s", "  Restore session", ":SessionRestore<CR>"),
            dashboard.button("b", "  Jump to bookmarks", "<leader>fm<CR>"),
            dashboard.button("g", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
            dashboard.button("p", "  Plugins", "<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"),
            dashboard.button("h", "  Plugin help", ":SearchPluginHelp<CR>"),
            dashboard.button("n", "  Notes", ":Neorg workspace notes<CR>"), -- 
            dashboard.button("c", "  Codes", ":Neorg workspace codes<CR>"),
            dashboard.button("m", "  Mappings", ":e ~/.config/nvim/lua/ssossah/plugins/which-key.lua <CR>"),
            dashboard.button("l", "  Configuration", ":e ~/.config/nvim/ <CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        if vim.o.filetype == "lazy" then
            -- close and re-open Lazy after showing alpha
            vim.notify("Missing plugins installed!", vim.log.levels.INFO, { title = "lazy.nvim" })
            vim.cmd.close()
            require("alpha").setup(dashboard.opts)
            require("lazy").show()
        else
            require("alpha").setup(dashboard.opts)
        end



        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                --header
                dashboard.section.header.val = header()
                --footer
                local fortune = require("alpha.fortune")
                dashboard.section.footer.val = fortune()
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
