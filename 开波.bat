@echo off
pushd %~dp0

::VSCODE����ϵͳĬ��·��
set "CodeData=%appdata%\Code\"

:: ����Դ�ļ����ڵ�ϵͳ·��
set "BACK0=%CodeData%\Backups"
set "STORAGE0=%CodeData%\storage.json"
set "KEYSET0=%CodeData%\User\keybindings.json"

:: �����������ļ���·��
set "BACK1=%~dp0.vscode\Backups"
set "STORAGE1=%~dp0.vscode\storage.json"
set "KEYSET1=%~dp0.vscode\keybindings.json"

:: ������������δ�������ݵ�������
rd /S /Q "%BACK0%"
REM del /F /Q "%STORAGE0%"
del /F /Q "%KEYSET0%"

:: ������
mklink /D "%BACK0%" "%BACK1%"
REM mklink /H "%STORAGE0%" "%STORAGE1%"
mklink /H "%KEYSET0%" "%KEYSET1%"

code  . && exit
pause
exit
