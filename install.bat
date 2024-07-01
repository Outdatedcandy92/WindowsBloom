@echo off

REM Get the directory path of the batch script
set "scriptPath=%~dp0"

REM Remove trailing backslash
set "scriptPath=%scriptPath:~0,-1%"

:MainMenu
echo Windows Wallpaper Animation Installer
echo.
echo 1. Install
echo 2. Uninstall
echo 3. Exit
echo.

choice /C 123 /N /M "Select an option: "

if errorlevel 3 goto End
if errorlevel 2 goto Uninstall
if errorlevel 1 goto Install

goto MainMenu

:Install
echo You have chosen to Install.
echo.
timeout /t 1 /nobreak >nul

echo Editing loom.ps1 and close.ps1 ...
REM Create a temporary file and write the new lines to it
echo $wallpaper1 = "%scriptPath%\media\start.png" >> temp.ps1
echo $wallpaper2 = "%scriptPath%\media\img.png" >> temp.ps1
echo $video = "%scriptPath%\media\startup.mp4" >> temp.ps1
echo $mpvPath = "%scriptPath%\src\mpv.exe" >> temp.ps1
echo $wallpaper1 = "%scriptPath%\start.png" >> temp1.ps1

REM Append the original file to the temporary file
type "%scriptPath%\src\bloom.ps1" >> temp.ps1
type "%scriptPath%\src\close.ps1" >> temp1.ps1
timeout /t 1 /nobreak >nul
REM Replace the original file with the temporary file
move /Y temp.ps1 bloom.ps1
REM Replace the original file with the temporary file
move /Y temp1.ps1 close.ps1

echo Editing done ...
timeout /t 2 /nobreak >nul

echo Creating run.vbs ...
timeout /t 1 /nobreak >nul
REM Create run.vbs
echo Set WshShell = CreateObject("WScript.Shell") > run.vbs
echo WshShell.Run chr(34) ^& "%scriptPath%\bloom.ps1" ^& Chr(34), 0 >> run.vbs
echo Set WshShell = Nothing >> run.vbs

echo Creating scheduled task ...
timeout /t 1 /nobreak >nul
schtasks /delete /tn "WindowsAnimation" /f
schtasks /create /tn "WindowsAnimation" /tr "%scriptPath%\run.vbs" /sc onlogon

echo Installation is complete.
goto End

:Uninstall
echo You have chosen to Uninstall.
echo Uninstallation logic goes here.
REM Add your uninstallation script here.
echo Removing scheduled task ...
timeout /t 1 /nobreak >nul
schtasks /delete /tn "WindowsAnimation" /f
echo Uninstallation is complete.
timeout /t 1 /nobreak >nul
echo You can now delete this folder.

goto End

:End
echo Operation completed.
pause
