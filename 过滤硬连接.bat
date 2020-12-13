@echo off
pushd %~dp0

@REM 我的文档路径
@REM 从注册表中读取
set work=
for /f "tokens=2*" %%a in ('REG QUERY "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal') do set "work=%%b"

set "poe=%work%\My Games\Path of Exile"


echo 文档路径：%poe%


set "mp3path=%poe%\mp3"
rd /q "%mp3path%"
mklink /D "%mp3path%" "%~dp0过滤器\音效"


REM rem 处理可能存在的资源文件夹 如音效
REM for /f %%i in ('dir /ad/b/s 过滤器') do (
REM     mklink /D "%USERPROFILE%\Documents\My Games\Path of Exile\mp3" "%%i"
REM )



rem 处理过滤文件
for /r %%i in (*.filter) do (
    rem 硬链接 过滤文件到我的文档下 poe 目录
    del /f /q "%poe%\%%~nxi"
    mklink /H "%poe%\%%~nxi" "%%i"
)

pause
exit
