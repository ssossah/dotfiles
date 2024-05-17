-- notification manager
return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            stages = 'fade_in_slide_out',
            background_colour = 'FloatShadow',
        })
    vim.notify = require('notify')
end,
}
