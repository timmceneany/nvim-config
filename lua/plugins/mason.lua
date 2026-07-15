return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "debugpy", "codelldb", "cpptools", "black" },
    },
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
}
