require('barbar').setup({
     icons = {
        gitsigns = {
              added = {enabled = true, icon = '+'},
              changed = {enabled = true, icon = '~'},
              deleted = {enabled = true, icon = '-'},
            },
     },
    filetype = {
          custom_colors = false,
          enabled = true,
      },
    preset = 'default', -- "powerline", "slanted", "default"
})
