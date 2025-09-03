::Updates and Starts Game Server
@echo off

set STEAMCMD_PATH="%CD%\steamcmd\steamcmd.exe"
set APP_ID=1512690
set INSTALL_DIR="%CD%\renown"
set SERVER_EXEC_PATH="%CD%\renown\Renown_CombatServer.exe"
set EOS_FLAGS=-ini:Engine:[EpicOnlineServices]:DedicatedServerClientId=xyza78917DzEE5Ey0isciVt66QDm5IzM -ini:Engine:[EpicOnlineServices]:DedicatedServerClientSecret=m/mrnywFCdeA1mW3ZSvv3qcVlQlfwi1a+7Z63Q44E
::You can set additional arguments with the "ADD_ARGS" var in the following format: -ARG1 -ARG2 -ARG3
set ADD_ARGS=
::If you want to run the beta branch set "BETA_BRANCH" equal to "beta"
set BETA_BRANCH=


if not exist %STEAMCMD_PATH% (
    echo SteamCMD not found at %STEAMCMD_PATH%. Please update the path.
    pause
    exit /b 1
)
if not exist "%SERVER_EXEC_PATH%" (
    echo Error: Executable not found at %SERVER_EXEC_PATH%.
    pause
    exit /b 1
)

if defined BETA_BRANCH (
    set BETA="-beta %BETA_BRANCH%"
)

if defined ADD_ARGS (
    set USER_DEF_ARGS=%ADD_ARGS%
)

%STEAMCMD_PATH% +force_install_dir %INSTALL_DIR% +login anonymous +app_update %APP_ID% %BETA% validate +quit

start "" "%SERVER_EXEC_PATH%" -log %EOS_FLAGS% %USER_DEF_ARGS%

exit 0
