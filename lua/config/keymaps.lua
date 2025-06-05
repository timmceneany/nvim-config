vim.keymap.set("v", "<C-c>", '"+y', {})
vim.keymap.set("n", "<C-s>", ":w<cr>", {})
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", {})
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", {})

vim.keymap.set("n", "gK", function()
  local new_config = not vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({ virtual_lines = new_config })
end, { desc = "Toggle diagnostic virtual_lines" })

-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
