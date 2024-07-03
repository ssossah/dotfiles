-- default editor settings
require("ssossah.core")
require("ssossah.lazy")

--open alpha when all buffers are closed rather than unammed buffer
vim.cmd(
    [[ au BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) && winnr('$') == 1 | exec 'Alpha' | endif ]]
)



-- TODO:
-- nvim dap missing config to work
