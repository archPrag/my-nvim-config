local function matlabShell()
  os.execute("nohup kitty ~/.config/nvim/runner/venvEx/bin/python ~/.config/nvim/runner/shell.py 1>/dev/null 2>&1 &")
end
local function runnerInit()
  os.execute("nohup ~/.config/nvim/runner/venvEx/bin/python ~/.config/nvim/runner/init.py 1>/dev/null 2>&1 &")
end

runnerInit()
vim.keymap.set('n','<leader>s',matlabShell)
