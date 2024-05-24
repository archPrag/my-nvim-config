import libtmux
import psutil
import os
import time
def matlabProccess():
    pList=[]
    for process in psutil.process_iter(["name","cmdline"]):
        for commandArg in process.cmdline():
            if commandArg.startswith('-nodesktop'):
                pList.append(process)
                print(commandArg)
    return(pList)
def run():
    os.system("MATLABConnector")
    server=libtmux.Server()
    session=server.sessions.filter(session_name="matlab")
    matlabNoDesktop=matlabProccess()
    print(session)
    print (matlabNoDesktop)
    if len(session)==0:
        session=server.new_session(session_name="matlab",window_command="matlab -nodesktop",attach=False)
        print("tmux session started")
        time.sleep(1)
    if len(matlabNoDesktop)==0:
        os.system("tmux send-keys -t matlab \"matlab -nodesktop\"")
        print("opened matlab in tmux Session")
        time.sleep(1)
run()
