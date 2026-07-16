return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader><leader>", function()
        builtin.find_files({ hidden = true })
      end, {})
      vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "List buffers" })
      vim.keymap.set("n", "<leader>/", builtin.live_grep, {})
      --vim.keymap.set("n", "<leader>of", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>o", function()
        builtin.lsp_document_symbols({ symbols = { "function", "method", "class" } })
      end, { desc = "Document symbols (functions)" })
      vim.keymap.set("n", "<leader>r", builtin.lsp_references, { desc = "List references" })

      require("telescope").load_extension("ui-select")
    end,
  },
}
