@echo off
pushd %~dp0

rem 处理可能存在的资源文件夹 如音效
for /f %%i in ('dir /ad/b/s 过滤器') do (
    mklink /D "%USERPROFILE%\Documents\My Games\Path of Exile\mp3" "%%i"
)

rem 处理过滤文件
for /r %%i in (*.filter) do (
    rem 硬链接 过滤文件到我的文档下 poe 目录
    mklink /H "%USERPROFILE%\Documents\My Games\Path of Exile\%%~nxi" "%%i"
   
)

pause
exit






