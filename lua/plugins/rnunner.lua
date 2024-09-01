return{
  'CRAG666/code_runner.nvim',
  config=function()
  require('code_runner').setup({
    python = "python3 -u",
    octave = "octave ",
  })
  vim.keymap.set("n", "<leader>x", builtin.find_files, {})
  

  end


}
