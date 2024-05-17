-- easy workspace navigation & search
return {
	"natecraddock/workspaces.nvim",
    config = function()
        require("workspaces").setup()
    end,          
}
