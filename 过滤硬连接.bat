@echo off
pushd %~dp0

rem ������ܴ��ڵ���Դ�ļ��� ����Ч
for /f %%i in ('dir /ad/b/s ������') do (
    mklink /D "%USERPROFILE%\Documents\My Games\Path of Exile\mp3" "%%i"
)

rem ��������ļ�
for /r %%i in (*.filter) do (
    rem Ӳ���� �����ļ����ҵ��ĵ��� poe Ŀ¼
    mklink /H "%USERPROFILE%\Documents\My Games\Path of Exile\%%~nxi" "%%i"
   
)

pause
exit






