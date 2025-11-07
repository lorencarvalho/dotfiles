vim.g.vista_renderer_enable_icon = 1


-- Use bash from PATH instead of hardcoded version-specific path
vim.g.vista_ctags_cmd = {
    ['bash'] = 'bash'  -- Will use bash from PATH
}

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		local is_only_one_win = vim.fn.winnr("$") == 1
		local is_vista_open = vim.fn["vista#sidebar#IsOpen"]() == 1

		if is_only_one_win and is_vista_open then
			vim.cmd("silent! q!")
		end
	end,
})
