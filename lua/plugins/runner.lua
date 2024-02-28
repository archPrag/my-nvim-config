return {
	{
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				filetype = {
					python = "python3 -u",
					rust = {
						"cd $dir &&",
						"rustc $fileName &&",
						"$dir/$fileNameWithoutExt",
					},
				},
	 		})
      vim.keymap.set('n', '<leader>x', ':RunCode<CR>', { noremap = true, silent = false })
		end,
	},
}
