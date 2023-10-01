require("bufferline").setup{}
local toggle_tree = {}
toggle_tree.open = function()
    require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

toggle_tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return toggle_tree
