TITLE Carbon AUX01 Install
REM Author: pkeffect@gmail.com
@ECHO OFF
CLS
color 0e
:MENU
CLS

set steamCMDPath="%CD%\.steamcmd\steamcmd.exe"
set serverPath="%CD%"
set serverFolder="%CD%\server\rust"

GOTO :MAIN

:UpdateServerAndValidate
@echo Updating and Validating Rust
%steamCMDPath% +force_install_dir %serverPath% +login anonymous +app_update 258550 -beta aux01 validate +quit
@echo Rust Carbon AUX01 server updated!
pause
EXIT /B 0

:UpdateCarbon 
@echo Downloading Carbon AUX01 Update
curl -L "https://github.com/CarbonCommunity/Carbon/releases/download/rustbeta_aux01_build/Carbon.Windows.Debug.zip" --output "%serverPath%\Carbon.Windows.Debug.zip"
@powershell.exe -Command "expand-archive -force -literalpath '%serverPath%\Carbon.Windows.Debug.zip' -destinationpath %serverPath%"

@echo Deleting ZIP File
del "%serverPath%\Carbon.Windows.Debug.zip"
@echo Carbon AUX02 Updated! Zip file deleted.
pause
EXIT /B 0

:UpdateRustEdit
@echo Downloading RustEdit Update
curl -L "https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll" --output "%serverPath%\carbon\extensions\Oxide.Ext.RustEdit.dll"
@echo RustEdit DLL updated!
pause
EXIT /B 0

:MAIN
set /p opt="Select An Option (1 = Install/Update Carbon AUX01 & RustEdit, 2 = Exit): "
if %opt% == 1 call :UpdateServerAndValidate & call :UpdateCarbon & call :UpdateRustEdit
if %opt% == 2 exit
