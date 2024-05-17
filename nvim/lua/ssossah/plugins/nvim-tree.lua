return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()

    local nvimtree = require('nvim-tree')

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=$3FC5FF ]])

    -- configure nvim-tree
    nvimtree.setup({
      view = {
          width = 100,
          relativenumber = true
      },
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        -- update_root = true,
        -- update_cwd = true
      },
      filters = {
          dotfiles = false,
      },
      git = {
          enable = true,
          ignore = false,
          timeout = 500,
      },
      view = {
          width = 30,
          --height = 30,
          side = "left",
          --auto_resize = true,
      },
    })

    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>nc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>nl", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
    keymap.set("n", "<leader>nf", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" }) -- focus file explorer
  end

}
