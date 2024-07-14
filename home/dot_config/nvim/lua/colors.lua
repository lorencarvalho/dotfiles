require('material').setup({
    plugins = {
        "nvim-tree",
        "telescope",
        "nvim-cmp",
    },
    lualine_style = "stealth"
})

vim.g.material_style = "darker"
vim.cmd "colorscheme material"

require('lualine').setup({
    options = {
        theme = 'material',
    },
})
