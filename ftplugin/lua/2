import libtmux
import os
import time
def run():
    file=open("/home/arthur/.config/nvim/runner/message.log")
    text=file.read()
    i=-1
    while text[i]!='/':
        i-=1
    directory=text[0:i]
    exec=text[i+1:]
    server=libtmux.Server()
    session=server.sessions.filter(session_name="nvim")
    if len(session)==0:
        session=server.new_session(session_name="nvim",attach=False)
        print("waiting for start")
        os.system("tmux attach -t nvim")
        time.sleep(1)
    os.system("tmux send-keys -t nvim \"cd "+directory+"&& lua "+exec+"\n\"")
    os.system("tmux attach -t nvim")
run()
