local function matlabExec()
  local path=vim.fn.expand('%:p')
  local file=io.open("/home/arthur/.config/nvim/runner/message.log","w")
  file:write(path)
  file:close()
  vim.cmd(":w")
  os.execute("nohup kitty ~/.config/nvim/ftplugin/matlab/venvM/bin/python ~/.config/nvim/ftplugin/matlab/execution.py 1>/dev/null 2>&1 &")
end
local function matlabShell()
  os.execute("nohup kitty ~/.config/nvim/ftplugin/matlab/venvM/bin/python ~/.config/nvim/ftplugin/matlab/shell.py 1>/dev/null 2>&1 &")
end
local function matlabInit()
  os.execute("nohup ~/.config/nvim/ftplugin/matlab/venvM/bin/python ~/.config/nvim/ftplugin/matlab/init.py 1>/dev/null 2>&1 &")
end

matlabInit()
vim.keymap.set('n','<leader>x',matlabExec)
vim.keymap.set('n','<leader>s',matlabShell)
