@echo off
pushd %~dp0

@REM �ҵ��ĵ�·��
@REM ��ע����ж�ȡ
set work=
for /f "tokens=2*" %%a in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal') do set "work=%%b"

set "poe=%work%\My Games\Path of Exile"


echo �ĵ�·����%poe%


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
