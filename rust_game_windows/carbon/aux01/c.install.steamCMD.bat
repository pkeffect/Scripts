TITLE SteamCMD Install
REM Author: pkeffect@gmail.com
@ECHO OFF
CLS
color 0e
:MENU
CLS
REM This script downloads, extracts, and runs SteamCMD

REM Define variables
set "steamcmdUrl=https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set "steamcmdZip=steamcmd.zip"
set "steamcmdDir=.steamcmd"

REM Download SteamCMD using curl
echo Downloading SteamCMD...
curl -o "%steamcmdZip%" -L "%steamcmdUrl%"
if not exist "%steamcmdZip%" (
    echo Failed to download SteamCMD.
    pause
    exit /b 1
)

REM Extract SteamCMD
echo Extracting SteamCMD...
powershell -Command "Expand-Archive -Path '%steamcmdZip%' -DestinationPath '%steamcmdDir%' -Force"
if not exist "%steamcmdDir%" (
    echo Failed to extract SteamCMD.
    pause
    exit /b 1
)

REM Remove zip file
echo Removing zip file...
del /f /q "%steamcmdZip%"

REM Run SteamCMD
echo Running SteamCMD...
cd /d "%steamcmdDir%"
start "" steamcmd.exe