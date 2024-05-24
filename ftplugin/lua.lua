local function runnerExec()
  local path=vim.fn.expand('%:p')
  local file=io.open("/home/arthur/.config/nvim/runner/message.log","w")
  file:write(path)
  file:close()
  vim.cmd(":w")
  os.execute("nohup kitty ~/.config/nvim/ftplugin/matlab/venvM/bin/python ~/.config/nvim/ftplugin/lua/execution.py 1>/dev/null 2>&1 &")
end
vim.keymap.set('n','<leader>x',runnerExec)
