@echo off
::You can set additional arguments with the "ADD_ARGS" var in the following format: -ARG1 -ARG2 -ARG3
set ADD_ARGS=
set SERVER_EXEC_PATH="%CD%\renown\Renown_CombatServer.exe"
set EOS_FLAGS=-ini:Engine:[EpicOnlineServices]:DedicatedServerClientId=xyza78917DzEE5Ey0isciVt66QDm5IzM -ini:Engine:[EpicOnlineServices]:DedicatedServerClientSecret=m/mrnywFCdeA1mW3ZSvv3qcVlQlfwi1a+7Z63Q44EGU

if defined ADD_ARGS (
    set USER_DEF_ARGS=%ADD_ARGS%
)

if not exist "%SERVER_EXEC_PATH%" (
    echo Error: Executable not found at %SERVER_EXEC_PATH%.
    pause
    exit /b 1
)

start "" "%SERVER_EXEC_PATH%" -log %EOS_FLAGS% %USER_DEF_ARGS%
exit 0