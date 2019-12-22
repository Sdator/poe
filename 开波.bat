@echo off
pushd %~dp0

set "CodeData=%appdata%\Code\"
set "BACK=%appdata%\Code\Backups"
set "INFO=%USERPROFILE%\storage.json"
set "FILE=%~dp0.vscode\storage.json"

rem 预处理
rd /S /Q "%BACK%"
mklink /D "%BACK%" "%~dp0.vscode\Backups"

rem 创建备份 防止硬链接被错误删除
copy %FILE% %FILE%.back
del /Q "%INFO%"

mklink /H "%INFO%" %FILE%.back


pause
code  .
exit

