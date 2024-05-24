import libtmux
import os
import time
import psutil
def matlabProccess():
    pList=[]
    for process in psutil.process_iter(["name","cmdline"]):
        for commandArg in process.cmdline():
            if commandArg.startswith('-nodesktop'):
                pList.append(commandArg)
    return(pList)
def run():
    server=libtmux.Server()
    session=server.sessions.filter(session_name="matlab")
    matlabNoDesktop=matlabProccess()
    if len(session)==0:
        session=server.new_session(session_name="matlab",window_command="matlab -nodesktop",attach=False)
        print("waiting for matlab to start")
        os.system("tmux attach -t matlab")
        time.sleep(1)
    if len(matlabNoDesktop)==0:
        os.system("tmux send-keys -t matlab \"matlab -nodesktop\"")
        print("opened matlab in tmux Session")
        os.system("tmux attach -t matlab")
        time.sleep(1)
    os.system("tmux attach -t matlab")
run()
