local icon_val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
 return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = icon_val

 dashboard.section.buttons.val = {
   dashboard.button("e",  "  New file", ":ene <BAR> startinsert <CR>"),
   dashboard.button("r",  "  Recently used files", ":Telescope oldfiles <CR>"),
   dashboard.button("f",  "󰈞  Find file", ":Telescope find_files <CR>"),
   dashboard.button("t",  "󰈬  Find word", ":Telescope live_grep <CR>"),
   dashboard.button("jb", "  Jump to Bookmarks", "<leader>fm<CR>"),
   dashboard.button("cs", "  Change colorscheme", ":qa<CR>"),
   dashboard.button("c",  "  Configuration", ":e ~/.config/nvim/init.vim<CR>"),
   dashboard.button("p",  "  Plugins", ":e ~/.config/nvim/lua/plugins/packer_plugins.lua<CR>"),
   dashboard.button("q",  "  Quit Neovim", ":qa<CR>"),
} --  󰷾   󰄉 󰅚

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
