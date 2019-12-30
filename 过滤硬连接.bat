@echo off
pushd %~dp0
set "poe=%USERPROFILE%\Documents\My Games\Path of Exile"
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






