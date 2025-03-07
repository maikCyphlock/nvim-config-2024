return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      PATH = "prepend",
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- Autoinstall LSP servers cuando se abre un archivo relevante
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "typescript", "javascript", "html", "css", "astro" },
        callback = function()
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end,
        once = true
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = "mason.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "cssls",
        "html",
        "astro",
        "tailwindcss",
        "jsonls"
      },
      automatic_installation = true,
    }
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim" -- Mejor soporte para Lua
    },
    config = function()
      local lsp = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local wk = require("which-key")

      -- Configuración común para todos los LSP
      local on_attach = function(client, bufnr)
        -- Mapeos locales específicos del buffer
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        wk.register({
          l = {
            name = "LSP",
            k = { vim.lsp.buf.hover, "Hover", bufopts },
            d = { vim.lsp.buf.definition, "Go to Definition", bufopts },
            D = { vim.lsp.buf.declaration, "Go to Declaration", bufopts },
            r = { vim.lsp.buf.rename, "Rename Symbol", bufopts },
            R = { vim.lsp.buf.references, "References", bufopts },
            s = { vim.lsp.buf.signature_help, "Signature Help", bufopts },
            i = { "<cmd>LspInfo<cr>", "LSP Info", bufopts },
          },
          c = {
            name = "Code",
            a = { vim.lsp.buf.code_action, "Code Action", bufopts },
            f = { vim.lsp.buf.format, "Format Document", bufopts },
          },
          ["[d"] = { vim.diagnostic.goto_prev, "Previous Diagnostic", bufopts },
          ["]d"] = { vim.diagnostic.goto_next, "Next Diagnostic", bufopts },
        }, { prefix = "<leader>" })

        -- Configuración específica de clientes
        if client.name == "tsserver" then
          client.server_capabilities.documentFormattingProvider = false
        end

        if client.name == "lua_ls" then
          require("neodev").setup({})
        end
      end

      -- Configuraciones específicas de cada servidor
      lsp.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false
            },
            telemetry = { enable = false }
          }
        }
      })

      lsp.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          completions = { completeFunctionCalls = true },
          javascript = {
            format = { enable = false },
            suggest = { completeFunctionCalls = true }
          },
          typescript = {
            format = { enable = false },
            suggest = { completeFunctionCalls = true }
          }
        }
      })

      lsp.astro.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          typescript = {
            tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib"
          }
        }
      })

      -- Configuración para LSPs simples
      local servers = { "html", "cssls", "tailwindcss", "jsonls" }
      for _, server in ipairs(servers) do
        lsp[server].setup({
          capabilities = capabilities,
          on_attach = on_attach
        })
      end

      -- Configurar handlers de diagnóstico
      vim.diagnostic.config({
        virtual_text = { spacing = 4, prefix = "●" },
        float = { border = "rounded" },
        signs = true,
        update_in_insert = false
      })

      -- Iconos para diagnósticos
      local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end
  }
}
