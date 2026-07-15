return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Cache detection results per project root so we don't re-read files on every format.
    local py_formatter_cache = {}

    -- Walk up from the buffer to find the nearest project config file and read it.
    local function read_project_config(bufnr)
      local path = vim.api.nvim_buf_get_name(bufnr)
      local dir = path ~= "" and vim.fs.dirname(path) or vim.fn.getcwd()
      local matches = vim.fs.find({ "pyproject.toml", "setup.cfg", "tox.ini" }, {
        upward = true,
        path = dir,
        type = "file",
      })
      local file = matches[1]
      if not file then
        return nil, nil
      end
      local ok, lines = pcall(vim.fn.readfile, file)
      if not ok then
        return file, nil
      end
      return file, table.concat(lines, "\n")
    end

    -- Choose Python formatters based on what the project declares.
    local function python_formatters(bufnr)
      local file, contents = read_project_config(bufnr)
      local key = file or "__none__"
      if py_formatter_cache[key] ~= nil then
        return py_formatter_cache[key]
      end

      local chosen
      if contents and contents:match("%[tool%.black%]") then
        -- Black project: format with black; keep ruff for import/lint fixes.
        chosen = { "ruff_fix", "black" }
      else
        -- Default to Ruff (covers [tool.ruff] and projects with no explicit config).
        chosen = { "ruff_fix", "ruff_organize_imports", "ruff_format" }
      end

      py_formatter_cache[key] = chosen
      return chosen
    end

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = python_formatters,
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
    })
  end,
}
