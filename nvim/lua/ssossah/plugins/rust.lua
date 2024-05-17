-- for later
return {
    {
      'mrcjkb/rustaceanvim',
      version = '^4', -- Recommended
      lazy = false, -- This plugin is already lazy
    },
    {
        'saecki/crates.nvim',
        lazy = true,
        ft = { "rust", "toml" },
        event = { "BufRead", "BufReadPre", "BufNewFile" },
        dependencies = { "nvim-lua/plenary.nvim" },
        tag = 'stable',
        config = function()
            require('crates').setup({
                popup = {
                    border = "rounded"
                }
            })
        end,
    }
}
