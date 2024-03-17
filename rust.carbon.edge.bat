@ echo off 
cls
color 0e
rem ======== ONLY CHANGE THESE LINES ========
set steamCMDPath="D:\steamservers\_steamcmd\steamcmd.exe"
set serverPath="D:\steamservers\rust.carbon.edge"
set serverFolder="D:\steamservers\rust.carbon.edge\server\rust"
rem ======== ONLY CHANGE THESE LINES ========

GOTO :MAIN

:UpdateServerAndValidate
@echo Updating and Validating Rust Server
%steamCMDPath% +force_install_dir %serverPath% +login anonymous +app_update 258550 validate +quit
@echo Rust server updated and validated!
pause
EXIT /B 0

:UpdateCarbon 
@echo Downloading Carbon Production Update
curl -L "https://github.com/CarbonCommunity/Carbon/releases/download/edge_build/Carbon.Windows.Debug.zip" --output "%serverPath%\Carbon.Windows.Debug.zip"
@powershell.exe -Command "expand-archive -force -literalpath '%serverPath%\Carbon.Windows.Debug.zip' -destinationpath %serverPath%"

@echo Deleting ZIP File
del "%serverPath%\Carbon.Windows.Debug.zip"
@echo Carbon Production Updated! Zip file deleted.
pause
EXIT /B 0

:UpdateRustEdit
@echo Downloading RustEdit Update
curl -L "https://github.com/k1lly0u/Oxide.Ext.RustEdit/raw/master/Oxide.Ext.RustEdit.dll" --output "%serverPath%\carbon\extensions\Oxide.Ext.RustEdit.dll"
@echo RustEdit DLL updated!
pause
EXIT /B 0

:MAIN
set /p opt="Select An Option (1 = Install/Update/Server/Carbon Edge/RustEdit, 2 = Exit): "
if %opt% == 1 call :UpdateServerAndValidate & call :UpdateCarbon & call :UpdateRustEdit
if %opt% == 2 exit