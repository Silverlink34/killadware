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
color 0e
ECHO Thank you for using my batch file!
REM The following command is meant to substitute a "wait" or "sleep" command.
REM The given ip doesn't exist. Nul hides it's output, 
REM and -w 3000 sets it to wait 3 seconds.
ping 1.1.1.1 -n 1 -w 2000 > nul
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
SET $Winxp=Microsoft Windows [Version 5.1.2600]
SET $Winxpsp1=Microsoft Windows [Version 5.1.2600.1105-1106]
SET $Winxpsp2=Microsoft Windows [Version 5.1.2600.2180]
SET $Winxpsp3=Microsoft Windows [Version 5.1.2600]
SET $Win8=Microsoft Windows [Version 6.2.9200]
SET $Win8.1=Microsoft Windows [Version 6.3.9600.16384.130821-1623]
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
REM The following commands will compare "$Winver" to the previously set OS variables, 
REM and determine and output your version and processor type.
echo.
IF /I "%$winver%"=="%$Win7sp1%" (echo You are running Windows 7 with Service Pack 1 and have a & echo %$Explprocsr%.)
pause
cls
color 04
echo Checking to see if Malwarebytes is installed...
pause


