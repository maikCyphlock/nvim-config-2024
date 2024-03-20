return {

	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		local ts = require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"lua",
				"go",
				"python",
				"rust",
				"yaml",
				"json",
				"html",
				"css",
				"javascript",
				"typescript",
				"tsx",
			},
			highlight = {
				enable = true,
			},
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true,
			},
		})
	end,
}
