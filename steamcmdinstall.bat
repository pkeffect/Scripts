@echo off
setlocal

REM Define variables
set "steamcmdUrl=https://steamcdn-a.akamaihd.net/client/installer/steamcmd.zip"
set "steamcmdZip=steamcmd.zip"
set "steamcmdDir=.steamcmd"

REM Function to download and extract SteamCMD
:DownloadAndExtractSteamCMD
echo Downloading SteamCMD...
certutil -urlcache -f %steamcmdUrl% %steamcmdZip%
if not exist "%steamcmdZip%" (
    echo Failed to download SteamCMD.
    exit /b 1
)

REM Function to extract SteamCMD
:ExtractSteamCMD
echo Extracting SteamCMD...
powershell -Command "Expand-Archive -Path '%steamcmdZip%' -DestinationPath '%steamcmdDir%' -Force"
if not exist "%steamcmdDir%" (
    echo Failed to extract SteamCMD.
    exit /b 1
)

echo SteamCMD downloaded and extracted successfully.

REM Function to run SteamCMD
:RunSteamCMD
echo Running SteamCMD...
cd /d "%steamcmdDir%"
steamcmd.exe
if %errorlevel% neq 0 (
    echo Error: Failed to run SteamCMD.
    exit /b 1
)

exit /b 0
