return {
    "L3MON4D3/LuaSnip",
    "Mofiqul/vscode.nvim",             -- vscode colorscheme
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",           -- lua functions that many plugins use
    "nvim-telescope/telescope.nvim",   -- a highly extendable fuzzy finder over lists
    "nvim-tree/nvim-tree.lua",
    "nvim-treesitter/nvim-treesitter", -- tree-sitter is a parser generator tool and an incremental parsing library
    "liuchengxu/vista.vim",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    { "goolord/alpha-nvim",
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
        end
    }
}
