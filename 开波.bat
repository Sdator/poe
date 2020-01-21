@echo off
pushd %~dp0

::VSCODE数据系统默认路径
REM set "CodeData=%appdata%\Code\"

REM :: 设置源文件所在的系统路径
REM set "BACK0=%CodeData%\Backups"
REM set "STORAGE0=%CodeData%\storage.json"
REM set "KEYSET0=%CodeData%\User\keybindings.json"

REM :: 设置软连接文件的路径
REM set "BACK1=%~dp0.vscode\Backups"
REM set "STORAGE1=%~dp0.vscode\storage.json"
REM set "KEYSET1=%~dp0.vscode\keybindings.json"

REM :: 清除其他程序的未保存数据的软连接
REM rd /S /Q "%BACK0%"
REM REM del /F /Q "%STORAGE0%"
REM del /F /Q "%KEYSET0%"

REM :: 软连接
REM mklink /D "%BACK0%" "%BACK1%"
REM REM mklink /H "%STORAGE0%" "%STORAGE1%"
REM mklink /H "%KEYSET0%" "%KEYSET1%"


set "插件目录=.vscode\extensions"
set "用户数据目录=.vscode\Code"

rem code --user-data-dir %用户数据目录% .

code .

pause
exit
