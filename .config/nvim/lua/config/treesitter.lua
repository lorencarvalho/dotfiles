require('nvim-treesitter.configs').setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = { "lua", "markdown", "markdown_inline", "python", "rust", "go" },
}
