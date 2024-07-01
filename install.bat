@echo off

REM Get the directory path of the batch script
set "scriptPath=%~dp0"

REM Remove trailing backslash
set "scriptPath=%scriptPath:~0,-1%"

echo Windows Wallpaper Animation Installer

timeout /t 1 /nobreak >nul

echo Editing loom.ps1 and close.ps1 ...

timeout /t 2 /nobreak >nul
REM Create a temporary file and write the new lines to it
echo $wallpaper1 = "%scriptPath%\start.png" >> temp.ps1
echo $wallpaper2 = "%scriptPath%\Gradient-Dark.png" >> temp.ps1
echo $video = "%scriptPath%\Gradient-Dark.mp4" >> temp.ps1
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


echo Everything is done. If you change the folder this script is in, you will need to run this script again to update the paths.
timeout /t 5 