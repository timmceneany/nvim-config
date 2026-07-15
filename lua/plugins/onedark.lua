return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    name = "onedark",
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      vim.cmd.colorscheme("onedark")
    end,
  },
}
