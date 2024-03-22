return {

  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
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
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true,
      },
    })
  end,
}
