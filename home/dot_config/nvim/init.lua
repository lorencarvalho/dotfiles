-- take me to your leader
vim.g.mapleader = ","

-- disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- lazy
require("plugins")

-- my options
require("options")

-- colors
require("colors")

-- plugins
require("nvim-tree").setup()
require('lualine').setup({
    options = {
        theme = 'vscode'
    }
})

-- my keymaps
require("keymaps")
