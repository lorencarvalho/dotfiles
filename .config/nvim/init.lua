-- take me to your leader
vim.g.mapleader = ","

-- disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- init
require("config.init")

-- my options
require("options")

-- colors
require("colors")

-- additional plugin configuration
require("config")

-- my keymaps
require("keymaps")
