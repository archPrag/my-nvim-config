local function texHandle()
  vim.cmd(":w")
  local path=vim.fn.expand('%:p')
  local position=string.len(path)-1
  while(string.sub(path,position,position)~="/")do
    position=position-1
  end
  local name=string.sub(path,position+1,string.len(path)-4)
  os.execute("pdflatex -shell-escape "..name..".tex")
  os.execute("kitty zathura "..name..".pdf &")
end

vim.keymap.set('n','<leader>x',texHandle)
