@echo off
pushd %~dp0

::VSCODE数据系统默认路径
set "CodeData=%appdata%\Code\"

:: 设置源文件所在的系统路径
set "BACK0=%CodeData%\Backups"
set "STORAGE0=%CodeData%\storage.json"
set "KEYSET0=%CodeData%\User\keybindings.json"

:: 设置软连接文件的路径
set "BACK1=%~dp0.vscode\Backups"
set "STORAGE1=%~dp0.vscode\storage.json"
set "KEYSET1=%~dp0.vscode\keybindings.json"

:: 清除其他程序的未保存数据的软连接
rd /S /Q "%BACK0%"
REM del /F /Q "%STORAGE0%"
del /F /Q "%KEYSET0%"

:: 软连接
mklink /D "%BACK0%" "%BACK1%"
REM mklink /H "%STORAGE0%" "%STORAGE1%"
mklink /H "%KEYSET0%" "%KEYSET1%"

code  . && exit
pause
exit
