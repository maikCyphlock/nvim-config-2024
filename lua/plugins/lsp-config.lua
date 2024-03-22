return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup({
        PATH = "prepend"
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",

    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "tsserver","cssls", "html", "astro" },

      })
    end

  },
  {
    "https://github.com/neovim/nvim-lspconfig",

    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- setup Language
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.html.setup({
        capabilities = capabilities })
      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.cssls.setup({
        capabilities = capabilities
      })
      lspconfig.golangci_lint_ls.setup({
        capabilities = capabilities
      })


      lspconfig.astro.setup({
          capabilities = capabilities,

        typescript = {}
      })

      local wk = require('which-key')
      --CUSTOM KEYBOARD BINDINGS
     -- vim.keymap.set('n', 'yy', vim.lsp.buf.hover, {})
      --vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      --vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

      wk.register({
        l = {
          name = "LSP",
          k = { vim.lsp.buf.hover, "Hover" },
          d = { vim.lsp.buf.definition, "Go to Definition" },
          D = { vim.lsp.buf.declaration, "Go to Declaration" },
      },
      c= {
          name ="Code actions LSP",
          a = { vim.lsp.buf.code_action, "Code Action"}
        }

      }, {prefix = "<leader>"})
    end

  }

}
