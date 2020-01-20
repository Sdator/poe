@echo off
pushd %~dp0
copy "音量调节.exe" "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup" >nul 2>nul  && echo 添加成功 || echo 权限不足，请右击管理员运行。
pause
exit


:: 2019.1.21  AIR 250740270
