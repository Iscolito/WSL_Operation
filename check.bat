@echo off
chcp 65001
echo 已安装下列linux
wsl --list --verbose
goto menu
:menu
echo =-=-=-=-=选择进行的操作=-=-=-=-=
echo 停止运行		ID=1
echo 安装新的linux 		ID=2
echo 查看全部wsl命令 	ID=3
echo 查看详细状态		ID=4
echo 修改版本号(Ubuntu) 	ID=5
echo 查看wsl中的文件		ID=6
echo 变更用户权限		ID=7
echo 退出			ID=e
echo ---------------------------------
echo	      mod by Iscolito
echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
set /p ID=ID=

if "%ID%"=="1"  goto cmd1
if "%ID%"=="2"  goto cmd2
if "%ID%"=="3"  goto cmd3
if "%ID%"=="4"  goto cmd4
if "%ID%"=="5"  goto cmd5
if "%ID%"=="6"  goto cmd6
if "%ID%"=="7"  goto cmd7
if "%ID%"=="e"  goto con2


:cmd1
wsl --shutdown
echo 已成功关闭全部wsl
goto back

:cmd2
wsl --list --online
echo 已列出可用的linux全部发行版
pause
exit

:cmd3
wsl --help
goto back

:cmd4
wsl --status
goto back

:cmd5
wsl.exe --set-version Ubuntu 2
goto back

:cmd6
echo 在linux命令行中运行explorer.exe .
echo 若要修改文件，请先变更用户权限
goto back

:cmd7
set /p ChUser=需要变更为何种权限(root/user):
if "%ChUser%"=="root"  goto root
if "%ChUser%"=="user"  goto user
:root
ubuntu config --default-user root
wsl --shutdown
echo 已成功修改为管理员权限，并重启了wsl
goto back
:user
set /p user_name=请输要切换到的用户:
ubuntu config --default-user %user_name%
wsl --shutdown
echo 已成功切换到%user_name%，并重启了wsl
goto back

:back
set /p choice=是否要返回菜单(y/n):
if "%choice%"=="y"  goto con1
if "%choice%"=="n"  goto con2

:con1
echo.
goto menu
echo.


:con2
exit

pause