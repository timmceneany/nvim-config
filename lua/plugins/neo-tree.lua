return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    -- sources = { "document_symbols" },
  },

  config = function()
    require("neo-tree").setup({
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal float toggle=true<CR>", {})
    vim.keymap.set("n", "<leader>m", ":Neotree filesystem reveal left toggle=true<CR>", {})
    vim.keymap.set("n", "<C-b>", ":Neotree buffers reveal float toggle=true<CR>", {})
    vim.keymap.set("n", "<leader>s", ":Neotree document_symbols reveal float toggle=true<CR>", {})
  end,
}
