@echo off
color 0a
echo Are you sure you want to update? You will lose any local changes.
echo If you need to push local changes to remote, use:
echo git push remote master
echo.
set /p ask1=Press y to update or any other key to exit.(y/n)
IF %ask1%==y goto gitupdate
IF NOT %ask1%==y exit
:gitupdate
(
echo ls
echo git fetch --all
echo git reset --hard origin/master
) | ..\git-bash.bat
pause