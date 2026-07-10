vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.swapfile = false

vim.opt.number = true
vim.opt.relativenumber = true

local osc52 = require("vim.ui.clipboard.osc52")
local function reg_paste()
  return function()
    return vim.split(vim.fn.getreg('"'), "\n")
  end
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = reg_paste(),
    ["*"] = reg_paste(),
  },
}
vim.opt.clipboard = "unnamedplus"
