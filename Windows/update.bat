@echo off

set STEAMCMD_PATH="%CD%\steamcmd\steamcmd.exe"
set APP_ID=1512690
set INSTALL_DIR="%CD%\renown"
::If you want to run the beta branch set "BETA_BRANCH" equal to "beta"
set BETA_BRANCH=


if not exist %STEAMCMD_PATH% (
    echo SteamCMD not found at %STEAMCMD_PATH%. Please update the path.
    pause
)

if defined BETA_BRANCH (
    set BETA="-beta %BETA_BRANCH%"
)

%STEAMCMD_PATH% +force_install_dir %INSTALL_DIR% +login anonymous +app_update %APP_ID% %BETA% validate +quit

pause