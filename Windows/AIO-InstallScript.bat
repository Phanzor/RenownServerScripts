::This script is intended to install SteamCMD, Renown, a base config of ini's, and download the start/update script
@echo off
set BASE_DIR=%CD%
set STEAMCMD_DOWNLOAD_URL=https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip
set SERVER_EXEC_PATH="%BASE_DIR%\renown\Renown_CombatServer.exe"
set EOS_FLAGS=-ini:Engine:[EpicOnlineServices]:DedicatedServerClientId=xyza78917DzEE5Ey0isciVt66QDm5IzM -ini:Engine:[EpicOnlineServices]:DedicatedServerClientSecret=m/mrnywFCdeA1mW3ZSvv3qcVlQlfwi1a+7Z63Q44E
set STEAMCMD_PATH="%BASE_DIR%\steamcmd\steamcmd.exe"
set APP_ID=1512690
set INSTALL_DIR="%BASE_DIR%\renown"


echo Downloading steamcmd...
curl -o steamcmd.zip %STEAMCMD_DOWNLOAD_URL%
if errorlevel 1 (
    echo Error: Download failed.
    pause
    exit /b 1
)

if not exist steamcmd mkdir steamcmd

echo Extracting file...
tar -xf steamcmd.zip -C steamcmd
if errorlevel 1 (
    echo Error: Extraction failed. Ensure tar is available or file is valid.
    pause
    exit /b 1
)

if exist steamcmd.zip (
    del /F steamcmd.zip
)

echo Download and extraction complete.

if not exist %STEAMCMD_PATH% (
    echo SteamCMD not found at %STEAMCMD_PATH%. Please update the path.
    pause
)

%STEAMCMD_PATH% +force_install_dir %INSTALL_DIR% +login anonymous +app_update %APP_ID% %BETA% validate +quit

if not exist "%SERVER_EXEC_PATH%" (
    echo Error: Executable not found at %SERVER_EXEC_PATH%.
    pause
    exit /b 1
)

if exist %BASE_DIR%\renown\Renown_Combat\Saved\Config\WindowsServer (
    curl -L -o %BASE_DIR%\renown\Renown_Combat\Saved\Config\WindowsServer\Game.ini https://raw.githubusercontent.com/Phanzor/RenownServerScripts/refs/heads/main/Dependencies/Game.ini
    curl -L -o %BASE_DIR%\renown\Renown_Combat\Saved\Config\WindowsServer\Engine.ini https://raw.githubusercontent.com/Phanzor/RenownServerScripts/refs/heads/main/Dependencies/Engine.ini
)

curl -o %BASE_DIR%\Start-Server.bat https://raw.githubusercontent.com/Phanzor/RenownServerScripts/refs/heads/main/Windows/Start-Server.bat

start "" "%SERVER_EXEC_PATH%" -log %EOS_FLAGS% %USER_DEF_ARGS%