TITLE Carbon Edge Install
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
%steamCMDPath% +force_install_dir %serverPath% +login anonymous +app_update 258550 validate +quit
@echo Rust Carbon Edge server updated and validated!
pause
EXIT /B 0

:UpdateCarbon 
@echo Downloading Carbon Edge Update
curl -L "https://github.com/CarbonCommunity/Carbon/releases/download/production_build/Carbon.Windows.Release.zip" --output "%serverPath%\Carbon.Windows.Release.zip"
@powershell.exe -Command "expand-archive -force -literalpath '%serverPath%\Carbon.Windows.Release.zip' -destinationpath %serverPath%"

@echo Deleting ZIP File
del "%serverPath%\Carbon.Windows.Release.zip"
@echo Carbon Edge Updated! Zip file deleted.
pause
EXIT /B 0

:UpdateRustEdit
@echo Downloading RustEdit Update
curl -L "https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll" --output "%serverPath%\carbon\extensions\Oxide.Ext.RustEdit.dll"
@echo RustEdit DLL updated!
pause
EXIT /B 0

:MAIN
set /p opt="Select An Option (1 = Install/Update Carbon Edge & RustEdit, 2 = Exit): "
if %opt% == 1 call :UpdateServerAndValidate & call :UpdateCarbon & call :UpdateRustEdit
if %opt% == 2 exit
