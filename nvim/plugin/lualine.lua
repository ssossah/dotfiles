local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'catppuccin',--'solarized_dark',
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {{ 'filename', path = 2 }}, -- 0 = just filename, 1 = relative path, 2 = absolute path
    lualine_x = {
      {
         'diagnostics',
         sources = {"nvim_lsp"},
         symbols = {
             error = ' ', warn = ' ', info = ' ', hint = ' '
         },
         colored = true,-- Displays diagnostics status in color if set to true.
        always_visible = false,   -- Show diagnostics even if there are none.
      },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
