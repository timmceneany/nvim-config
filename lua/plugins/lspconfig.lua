return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "saghen/blink.cmp" },
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      for _, server in ipairs({ "lua_ls", "pyright" }) do
        vim.lsp.config(server, { capabilities = capabilities })
        vim.lsp.enable(server)
      end

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        -- Tree-sitter provides the OneDark syntax groups for Rust. Avoid
        -- rust-analyzer semantic tokens painting another layer over them.
        on_init = function(client)
          client.server_capabilities.semanticTokensProvider = nil
        end,
      })
      vim.lsp.enable("rust_analyzer")
    end,
  },
}
