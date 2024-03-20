return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
    
require("mason-null-ls").setup({
    handlers = {},
}) 
    end,

  }
}
