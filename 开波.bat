@echo off
pushd %~dp0


code  .
exit

set "CodeData=%appdata%\Code\"
set "BACK=%appdata%\Code\Backups"
set "INFO=%USERPROFILE%\storage.json"
set "FILE=%~dp0.vscode\storage.json"

rem Ԥ����
rd /S /Q "%BACK%"
mklink /D "%BACK%" "%~dp0.vscode\Backups"

rem �������� ��ֹӲ���ӱ�����ɾ��
copy %FILE% %FILE%.back
del /Q "%INFO%"

mklink /H "%INFO%" %FILE%.back


pause