@echo off
pushd %~dp0
set "poe=%USERPROFILE%\Documents\My Games\Path of Exile"
set "mp3path=%poe%\mp3"
rd /q "%mp3path%"

mklink /D "%mp3path%" "%~dp0������\��Ч"


REM rem ������ܴ��ڵ���Դ�ļ��� ����Ч
REM for /f %%i in ('dir /ad/b/s ������') do (
REM     mklink /D "%USERPROFILE%\Documents\My Games\Path of Exile\mp3" "%%i"
REM )



rem ��������ļ�
for /r %%i in (*.filter) do (
    rem Ӳ���� �����ļ����ҵ��ĵ��� poe Ŀ¼
    del /f /q "%poe%\%%~nxi"
    mklink /H "%poe%\%%~nxi" "%%i"
)

pause
exit






