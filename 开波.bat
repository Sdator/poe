@echo off
pushd %~dp0

set "CodeData=%appdata%\Code\"
set "BACK=%appdata%\Code\Backups"
set "INFO=%appdata%\Code\storage.json"
set "FILE=%~dp0.vscode\storage.json"

rd /S /Q "%BACK%"
del /F /Q "%INFO%"

mklink /D "%BACK%" "%~dp0.vscode\Backups"
mklink /H "%INFO%" "%FILE%"

code  .

pause
exit
