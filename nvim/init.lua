-- neorg images:
-- Example for configuring Neovim to load user-installed installed Lua rocks:
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
--
-- local ok, err = pcall(require, "magick")
--
-- if ok then
--     print("that worked")
-- else
--     print("that failed")
-- end
-- package.path = package.path .. ";" .. "/Users/ssossah/.luarocks/share/lua/5.1/?/init.lua;"
-- package.path = package.path .. ";" .. "/Users/ssossah/.luarocks/share/lua/5.1/?.lua;"

require "options"
require "mappings"
require "dadbod"

-- Highlight on yank
vim.cmd([[
 augroup YankHighlight
   autocmd!
   autocmd TextYankPost * silent! lua vim.highlight.on_yank()
 augroup end
]])
--getting rid of ugly grey background tabbed background. Used "echo &tabline" and ":Telescope highlights" to do this
vim.cmd([[
 autocmd ColorScheme * highlight BufferCurrent guibg=#0d1421 guifg=white
 autocmd ColorScheme * highlight BufferCurrentSign guibg=#0d1421 guifg=None
 highlight CalendarSelect guibg=#36454f"#0c2c29"#242526""#c3d5e8"#b8ccc3
 highlight Calendar202b guifg=#ebcb8b"#0c2c29"#242526""#c3d5e8"#b8ccc3
 highlight Calendar202bSelect guifg=#ebcb8b guibg=None"#0c2c29"#242526""#c3d5e8"#b8ccc3
 highlight CalendarSundayTitle guifg=#7f848d guibg=#ffffff
 highlight CalendarSaturdayTitle guifg=#7f848d guibg=#ffffff"#303134
 highlight CalendarSunday guifg=#7f848d guibg=#ffffff
 highlight CalendarSaturday guifg=#7f848d guibg=#ffffff"#303134
 highlight CalendarToday guifg=#7f848d guibg=None
 ]])

-- open alpha when all buffers are closed rather than unammed buffer
vim.cmd [[ au BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) && winnr('$') == 1 | exec 'Alpha' | endif ]]

--alpha plugin help
function SearchPluginHelp()
    local pluginName = vim.fn.input('Enter plugin name: ')
    if pluginName ~='' then
        vim.cmd(":help " .. pluginName)
    end
end
vim.cmd([[command! -nargs=0 SearchPluginHelp lua SearchPluginHelp()]])


function RunCommand()
    local command = vim.fn.input('command: ')
    if command ~='' then
        vim.cmd(":!" .. command)
    end
end
vim.cmd([[command! -nargs=0 RunCommand lua RunCommand()]])
vim.api.nvim_set_keymap('n', '<leader>t', ':RunCommand<CR>', { noremap = true }) -- file explorer

-- colorscheme
local currentColorScheme = "onenord"
-- local currentColorScheme = "vscode"
function ChangeColorScheme()
    local newColorScheme = vim.fn.input('Enter colorscheme: ')
    if newColorScheme ~='' then
        currentColorScheme = newColorScheme
        vim.cmd(':colorscheme ' .. currentColorScheme)
    end
end
vim.cmd([[command! -nargs=0 ChangeColorScheme lua ChangeColorScheme()]])
vim.cmd(':colorscheme ' .. currentColorScheme)
--
-- --headlines
-- vim.cmd [[highlight Headline1 guibg=#1f2529]] -- #101214 #1f2529 #1c1c1c #262f36
-- -- vim.cmd [[highlight Headline2 guibg=#1f2529]] -- #36454f
-- vim.cmd [[highlight Headline2 guibg=#375f6b]]
-- vim.cmd [[highlight Headline3 guibg=None]]
-- vim.cmd [[highlight CodeBlock guibg=#1c1c1c]] --
-- vim.cmd [[highlight Dash guibg=None gui=bold]]
--
--neorg
-- vim.cmd [[highlight @attribute guifg=#ebcb8b]]
-- vim.cmd [[highlight @label guifg=#88c0d0]]
-- vim.cmd [[highlight @constant guifg=#b988b0]]
--vscode colorscheme
-- vim.cmd [[highlight @field guifg=#ffffff]]
-- vim.cmd [[highlight @constant guifg=#ffffff]]
-- vim.cmd [[highlight @method.call guifg=#ffffff]]
--
-- -- vim.cmd [[highlight Headline2 guibg=#375f6b]]
-- -- vim.cmd [[highlight @label guifg=#67c5e0]]
--
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
-- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
