@echo off
pushd %~dp0

set "���Ŀ¼=.\.vscode\extensions"
set "�û�����Ŀ¼=.\.vscode\Code"
code --user-data-dir %�û�����Ŀ¼% .

exit

