@Echo off
REM This is Brandon's script/batch file for removing adware and such. Enjoy.
REM The "REM" command is Windows's command for leaving comments.
REM These messages are all throughout the batch file to help explain functions of commands.
REM The "@Echo off" command disables the normal output, such as seeing your current directory throughout the batch file run.
REM The "color" command lets me set the background/text color. 
REM "color help" command for details. First digit is background, second is text.
REM using "color" by itself switches back to default.
color 0A
echo -------------------------------------------------------------------------------
echo Disclaimer: I am not responsible for any damage this may cause to your system.
echo Remember, you are running a batch file made by a person. 
echo If you are suspicious of its actions, please inspect the file yourself.
echo I do not own any of the programs that this batch file may use or download.
echo I am simply the author of the batch, automating tasks to easily remove adware.
REM "echo." returns a blank line. It makes me look fancy.
REM This "nul" command removes the "press any key to continue message" that pause command normally outputs.
REM This lets me customize the message to say the following...
echo -------------------------------------------------------------------------------
echo.
echo By pressing any key (there is no "any" key, I mean press any random key,)
echo You are agreeing to the disclaimer. 
echo Please close the window now if you do not accept.
pause>nul
REM "CLS" clears the screen of txt.
CLS
ECHO Thank you for using my batch file!
echo This script is written by Brandon.
echo If you have any questions email brandongaliher7@gmail.com.
echo Source is at http://github.com/silverlink34/killadware.git
REM The "set /p" command waits for user input. This instance is set to be hidden,
REM it is a hidden shortcut to skip around my script.
REM The "ping" command is meant to substitute a "wait" or "sleep" command.
REM The given ip doesn't exist. Nul hides it's output, 
REM and -w 3000 sets it to wait 3 seconds.
set /p skip1=
IF %skip1%==s goto winversioncheck
IF %skip1%==m goto runmbamscan
ping 1.1.1.1 -n 1 -w 4000 > nul
goto winversioncheck

:winversioncheck
CLS
color 0B
echo Checking Windows Version... 
echo (Currently Only looks for Windows XP, Vista, 7, 8 or 8.1)
ping 1.1.1.1 -n 1 -w 1000 > nul
REM The following functions will list outputs for all windows versions, but tell the user what version it is.
REM The "SET" command sets variables to an expression, ex. "SET green=red" so "echo %green%" displays "red."
REM The "ver" command shows windows version. It doesn't output exact name,
REM Such as "Windows 7", but it does return a number. I am using "set" to assign versions to expressions.
SET $Win7=Microsoft Windows [Version 6.1.7600]
SET $Win7sp1=Microsoft Windows [Version 6.1.7601]
SET $Winxp=Microsoft Windows XP [Version 5.1.2600]
SET $Winxpsp1=Microsoft Windows [Version 5.1.2600.1105-1106]
SET $Winxpsp2=Microsoft Windows [Version 5.1.2600.2180]
SET $Winxpsp3=Microsoft Windows [Version 5.1.2600]
SET $Win8=Microsoft Windows [Version 6.2.9200]
SET $Win81=Microsoft Windows [Version 6.3.9600.16384.130821-1623]
REM The following command takes output from "ver" and stores it to "$Winver"
for /f "delims=" %%i in ('ver') do set $Winver=%%i
REM The following command takes output from "%PROCESSOR_ARCHITECTURE%
REM And stores it to "$Winprocsr"
for /f "delims=" %%i in ('echo %PROCESSOR_ARCHITECTURE%') do set $Winprocsr=%%i
REM The following commands will use "set" and "if" to help define your processor type.
SET $AMD64=AMD Processor 64-Bit OS
SET $IA64=Intel Processor 64-Bit OS
SET $X86=32-Bit OS
REM The "if" command lets me execute commands if the conditions are met or not.
REM These commands will find out which processor type you have and set it to "$Explprocsr"
REM (explained processor)
IF /I %$Winprocsr%==AMD64 (SET $Explprocsr=%$AMD64%)
IF /I %$Winprocsr%==IA64 (SET $Explprocsr=%$IA6464%)
IF /I %$Winprocsr%==x86 (SET $Explprocsr=%$X86%)
REM The following commands will compare "$Winver" to the previously set OS variables, 
REM and determine and output your version and processor type.
REM Using labelled lines with commands to be executed. They will only run if the conditions are met.
REM Each sequence ends with "goto softwarecheck" which has it navigate to the next step of script.
echo.
IF /I "%$winver%"=="%$Win7sp1%" goto 71run
IF /I "%$winver%"=="%$Win7%" goto 7run
IF /I "%$winver%"=="%$Winxp%" goto xprun
IF /I "%$winver%"=="%$Winxpsp1%" goto xp1run
IF /I "%$winver%"=="%$Winxpsp2%" goto xp2run
IF /I "%$winver%"=="%$Winxpsp3%" goto xp3run
IF /I "%$winver%"=="%$Win8%" goto 8run
IF /I "%$winver%"=="%$Win81%" goto 81run

:osnotfound
color 0C
echo Could not determine your operating system.
echo This script needs to know if your operating system has a Program Files (x86) directory.
ping 1.1.1.1 -n 1 -w 5000 > nul
echo Checking for Program Files directories...
ping 1.1.1.1 -n 1 -w 3000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:set64
color 0B
echo Detected Program Files x(86) directory.
echo Setting Program Files directory for script..
SET $Progdir=%ProgramFiles(x86)%
ping 1.1.1.1 -n 1 -w 4000 > nul
goto softwarecheck

:set32
color 0B
echo Detected Program Files directory.
echo Setting Program Files directory for script..
SET $Progdir=%ProgramFiles%
ping 1.1.1.1 -n 1 -w 4000 > nul
goto softwarecheck

:71run
echo You are running Windows 7 && echo %$Explprocsr% with Service Pack 1.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:7run
echo You are running Windows 7 && echo %$Explprocsr% with no service packs.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:xprun
echo You are running Windows XP with no service packs.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:xp1run
echo You are running Windows XP with Service Pack 1.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:xp2run
echo You are running Windows XP with Service Pack 2.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:xp3run
echo You are running Windows XP with Service Pack 3.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:8run
echo You are running Windows 8 && echo %$Explprocsr%.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

:81run
echo You are running Windows 8.1 && echo %$Explprocsr%.
ping 1.1.1.1 -n 1 -w 2000 > nul
IF EXIST "C:/Program Files (x86)" goto set64
IF NOT EXIST "C:/Program Files (x86)" goto set32

REM This is the next step of the script that checks for MalwareBytes.
:softwarecheck
cls
color 0A
echo The script will now check for various programs to help with adware removal.
ping 1.1.1.1 -n 1 -w 3000 > nul
cls
echo Checking to see if Malwarebytes is installed...
echo.
ping 1.1.1.1 -n 1 -w 3000 > nul
REM Using "IF" command to determine if Malwarebytes is installed, and then sending to labelled lines with assigned commands.
REM "goto" doesn't work too well in parenthesis, and "if"s "else" command requires them.
REM I am using the "NOT" flag for "IF" which would mean if doesn't exist.
IF EXIST "%$Progdir%/Malwarebytes' Anti-Malware" goto mbamyes
IF NOT EXIST "%$Progdir%/Malwarebytes' Anti-Malware" goto mbamno
echo There was a problem detecting MalwareBytes.
echo Starting KillAdware mode.. 
goto killadware

:mbamyes
cls
color 0A
echo Malwarebytes Anti-Malware has been detected and installed on your system.
echo.
echo This script is intended to be ran after Malwarebytes scan because  
echo it will kill/remove leftover programs. 
echo This script can automate Malwarebytes scan.
ping 1.1.1.1 -n 1 -w 3000 > nul
echo.
echo If you like, I can start a Malwarebytes Full Scan for you.
set /p ask1=Would you like to run a full scan now? (y/n)
IF %ask1%==y goto runmbamscan
IF NOT %ask1%==y echo Skipping Malwarebytes Scan.
ping 1.1.1.1 -n 1 -w 2000 > nul
echo Entering KillAdware mode.
ping 1.1.1.1 -n 1 -w 2000 > nul
goto killadware


:mbamno
cls
color 0C
echo You do not have Malwarebytes installed on your system. 
echo It is advised to run Malwarebytes Full Scan before killadware begins.
echo.
echo This script is intended to be ran after Malwarebytes scan because  
echo it will kill/remove leftover programs. 
echo This script can automate Malwarebytes scan.
ping 1.1.1.1 -n 1 -w 3000 > nul
echo.
echo If you like, I can download Malwarebytes for you and run a Full Scan.
set /p ask1=Download Malwarebytes and then run a Full Scan? (y/n)
IF %ask1%==y goto dlmbam
IF NOT %ask1%==y echo Skipping MalwareBytes Download/Scan.
ping 1.1.1.1 -n 1 -w 2000 > nul
echo.
echo Entering KillAdware mode.
ping 1.1.1.1 -n 1 -w 2000 > nul
goto killadware

:dlmbam
color 0B
cls
echo You chose to download Malwarebytes. 
echo We will use V1.75, it works nicely and updates definitions.
echo.
echo Downloading mbam1.75.exe to C:\..
REM This command is calling the download script "dlmbam.vbs"
REM The script is downloading mbam1.75.exe from my website, and placing it at C:\.
cscript.exe dlmbam.vbs
REM Calling "fsize.bat" to find filesize and use "for" to store it to a variable.
REM Then we can verify if the file downloaded completely/correctly.
for /f "delims=" %%i in ('fsize.bat C:\mbam1.75.exe') do set $fsizembam=%%i
if %$fsizembam% EQU 10285040 echo Malwarebytes Installer was successfully downloaded.
if NOT %$fsizembam% EQU 10285040 goto rdlmbam
echo Starting installer now. Follow instructions, install to default locations.
echo Make at the end of the installer you uncheck all options:
echo "Enable free trial", "Update Malwarebytes" and "Launch" need to be disabled!
ping 1.1.1.1 -n 1 -w 6000 > nul
C:/mbam1.75.exe
goto runmbamscan

:runmbamscan
cls
color 1f
echo Updating malware definitions...
"%$Progdir%/Malwarebytes' Anti-Malware/mbam.exe"/update
echo.
echo Starting Malwarebytes.
ping 1.1.1.1 -n 1 -w 1000 > nul
echo.
echo Choose full scan, then choose drives that you use regularly.
echo Start the scan.
echo After the scan, click Show Results. 
echo Right click any of the found malware (if any) and choose Check All.
echo Choose Remove Selected.
echo Malwarebytes may need some time here to process removal.
echo After removal, you may need to reboot computer.
echo Read the rest of these directions before restarting.
echo After the restart (or if you didn't need to) choose the Quarantine Tab.
echo Choose Remove All.
echo After Quarantine removal, you may now exit Malwarebytes.
echo.
echo NOTE: After restarting, you will not see these instructions again.
echo If you need to restart, make sure you note the Quarantine removal step.
echo After restarting, re-run the script and skip the Malwarebytes scan
echo to directly enter KillAdware Mode.
echo If you didn't need to restart, just press any key after you close Malwarebytes.
"%$Progdir%/Malwarebytes' Anti-Malware/mbam.exe"
pause
echo Entering KillAdware mode.
ping 1.1.1.1 -n 1 -w 2000 > nul
goto killadware

:rdlmbam
Color 0c
Echo There was an error downloading MalwareBytes.
set /p %askre%=Retry downloading MalwareBytes? (y/n)
IF %askre%==y goto dlmbam
echo Skipping MalwareBytes Download/Scan.

:killadware
cls
color 4f
echo KillAdware initiated.
ping 1.1.1.1 -n 1 -w 2000 > nul
echo searching for known adware progranul
ping 1.1.1.1 -n 1 -w 5000 > nul

echo the real end of file
pause