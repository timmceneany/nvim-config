return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".stylua.toml",
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
  settings = {
    Lua = {
      diagnostics = {
        disable = { "missing-fields" },
        globals = {
          "vim",
        },
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
    },
  },
}
