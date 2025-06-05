return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
    vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk)
  end,
}
