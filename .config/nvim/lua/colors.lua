vim.cmd "colorscheme tomorrow-night"

require('lualine').setup({
    options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '',
        globalstatus = true,
        icons_enabled = false,
    },
})
