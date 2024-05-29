-- super fast git decorations
-- return {
--     "lewis6991/gitsigns.nvim",
--     event = { "BufReadPre", "BufNewFile" },
--     opts = {
--         on_attach = function(bufnr)
--             local gs = package.loaded.gitsigns
--
--             local function map(mode, l, r, desc)
--                 vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
--             end
--
--             -- Navigation
--             map("n", "]h", gs.next_hunk, "Next hunk")
--             map("n", "[h", gs.prev_hunk, "Previous hunk")
--
--             -- diffs
--             map("n", "<leader>hd", gs.diff_this, "Diff this")
--             map("n", "<leader>hD", gs.diff_this("~"), "Diff this ~")
--
--             -- config = function()
--             --     require("gitsigns").setup({})
--             -- end,
--         end,
--     },
-- }

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Navigation
            map("n", "]h", gs.next_hunk, "Next Hunk")
            map("n", "[h", gs.prev_hunk, "Prev Hunk")

            -- Actions
            -- map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")

            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, "Blame line")
            map("n", "<leader>hB", gs.toggle_current_line_blame, "Toggle line blame")

            map("n", "<leader>hd", gs.diffthis, "Diff this")
            map("n", "<leader>hD", function()
                gs.diffthis("~")
            end, "Diff this ~")

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
        end,
    },
}
