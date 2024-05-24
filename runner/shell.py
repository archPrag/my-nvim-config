import libtmux
import os
import time
def run():
    server=libtmux.Server()
    session=server.sessions.filter(session_name="nvim")
    if len(session)==0:
        session=server.new_session(session_name="nvim",attach=False)
        print("waiting for start")
        os.system("tmux attach -t nvim")
        time.sleep(1)
    os.system("tmux attach -t nvim")
run()
