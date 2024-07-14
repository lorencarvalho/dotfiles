local keymap = vim.keymap -- for conciseness
local ts = require('telescope.builtin')

-- browse buffers
keymap.set("n", "<leader>b", function()
    ts.buffers({sort_mru=true,ignore_current_buffer=true})
end)

-- pane nav
keymap.set("n", "<leader>h", "<C-w>h", { noremap = true, silent = true })
keymap.set("n", "<leader>j", "<C-w>j", { noremap = true, silent = true })
keymap.set("n", "<leader>k", "<C-w>k", { noremap = true, silent = true })
keymap.set("n", "<leader>l", "<C-w>l", { noremap = true, silent = true })

-- telescope
keymap.set("n", "<leader>ff", ts.find_files, {})
keymap.set("n", "<leader>fg", ts.live_grep, {})
keymap.set("n", "<leader>fb", ts.buffers, {})
keymap.set("n", "<leader>fh", ts.help_tags, {})
keymap.set("n", "<leader>ft", ts.treesitter, {})

-- map F1 to toggle NvimTree
keymap.set("n", "<F1>", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-- map F2 to enable Vista
keymap.set("n", "<F2>", "<cmd>Vista!!<CR>", { noremap = true, silent = true })

-- clear search highlights
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current 
