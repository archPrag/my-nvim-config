import libtmux
import time
def run():
    server=libtmux.Server()
    session=server.sessions.filter(session_name="nvim")
    print(session)
    if len(session)==0:
        session=server.new_session(session_name="nvim",attach=False)
        print("tmux session started")
        time.sleep(1)
run()
