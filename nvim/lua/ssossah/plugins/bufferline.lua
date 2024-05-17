return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                buffer_close_icon = "",
                close_command = "bdelete %d",
                close_icon = "",
                options = {
                    separator_style = "slant",
                },
                indicator = {
                    style = "icon",
                    icon = " ",
                },
                left_trunc_marker = "",
                modified_icon = "●",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
                right_mouse_command = "bdelete! %d",
                right_trunc_marker = "",
                show_close_icon = false,
                show_tab_indicators = true,
            },
        })
    end,
}
