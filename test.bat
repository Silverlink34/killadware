@echo off
dir /b "%ProgramFiles(x86)%" | findstr /N "."
set /p selpdir=Type the number and press enter to kill all running programs in that directory.
for /f "delims=1234567890:" %%p in ('dir /b "%ProgramFiles(x86)%" ^| findstr /N "." ^| findstr "%selpdir%"') do set slctddir=%%p
if defined selpdir goto killindir
goto skip

:killindir
echo Killing all exe's in selected folder..
rem These commands search the program directory and find any exe files that are running, then kill them.
rem The "for" command takes the result of a separate command and programs it to a variable, in this case the command is routed to variable %%i.
rem The token flag will tell "for" command to filter the result of the separate command by only using the first string found on each line. This filter is applied before the "do" command is executed.
rem The delimiter flag then filters the result of specified command by ignoring specified characters, in this case all numbers and a colon.
rem Explanation of specified command: (it is in parenthesis, starts with "dir")
rem The first command "dir" simply lists the specified directory. There will eventually be a prompt to select a directory in Program Files, and it will be set to a variable which will be used here.
rem The "dir" flags "/b" will tell the output to simply output the results with no additional details.
rem The output of dir (which is of a program files directory) is piped to "findstr" command, which searches for any files ending in .exe.
rem The "/n" flag for "findstr" numbers the results on the line they were found. Since the first "findstr" command finds the .exe files within all of the other files in the directory, they will not be labled 1,2,3..ect.
rem The reason for 3 "findstr" commands is how it handles the data. Here are the results for each command and what they return:
rem 1st findstr: lists all exe files. the /n flag will not number them 1,2,3 but whatever line number they were found from the previous "dir" output. (eg. program.exe app.exe)
rem 2nd findstr: numbers the results of 1st "findstr" as 1,2,3 ect. (eg. 1:program.exe 2:app.exe
rem 3rd findstr: selects result number and will output the exe with specified number. (eg. number specified is 2. output: 2:app.exe)
rem The "for" delimters then kicks in, so if the 3rd findstr outputs 2:app.exe, the "2" and ":" are removed and it then outputs app.exe and tells taskkill to kill app.exe using "do" command.
rem The command is listed several times simply so it will run taskkill individually for each found exe file. The 3rd findstr is moved up a number on each line that way it kills each result returned from all found .exe files. 
for /f "tokens=3 delims=\" %%i in ('dir *.exe /s/b ^| findstr ".exe" ^| findstr /n ".exe" ^| findstr /b "1:"') do echo %%i
goto skip
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "1:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "2:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "3:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "4:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "5:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "6:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "7:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "8:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "9:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "10:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "11:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "12:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "13:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "14:"') do taskkill /t /f /im %%i
for /f "tokens=1 delims=1234567890:" %%i in ('dir /s /b "%ProgramFiles(x86)%\%slctddir%" ^| findstr /s ".exe" ^| findstr /N ".exe" ^| findstr "15:"') do taskkill /t /f /im %%i
:skip
pause