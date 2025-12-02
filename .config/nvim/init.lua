-- take me to your leader
vim.g.mapleader = ","

-- disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- macros
vim.keymap.set("n", "m", "@q", { noremap = true })

-- init
require("config")

-- my options
require("options")

-- colors
require("colors")

-- my keymaps
require("keymaps")
