return {

	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
    local wk = require("which-key")

		require("trouble").setup()

		--vim.keymap.set("n", "<leader>xx", function()
			--require("trouble").toggle()
		--end)
		--vim.keymap.set("n", "<leader>xq", function()
		--	require("trouble").toggle("quickfix")
		--end)

  wk.register({
    x = {
      name = "Trouble",
      r = { "<cmd>Trouble lsp_references<cr>", "References" },
      f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
      d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
      q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
      l = { "<cmd>Trouble loclist<cr>", "LocationList" },
      w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    },
  }, { prefix = "<leader>" })
	end,
}
