return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "debugpy" },
    },
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
}
