@echo off
color 3f
echo This script will not add individual files. (yet)
echo All changed files will be pushed to remote (GitHub)
set /p ask1=Are you sure you are ready to save your changes and send them to remote? (y/n)
IF %ask1%==y goto gitcommitpush
IF NOT %ask1%==y exit
:gitcommitpush
(
echo git status
echo ping 1.1.1.1 -n 1 -w 2000 > nul
echo git add *
echo echo Please describe your commit.
echo set /p comment=Enter details for commit now.
echo git commit -m "%comment%"
echo echo Pushing everything to GitHub remote..
echo git push origin master
) | ..\git-bash.bat
pause