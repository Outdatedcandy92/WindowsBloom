
#Paths will go here after install.bat

$objShell = New-Object -ComObject "Shell.Application"

# Minimize all windows
$objShell.MinimizeAll()

# function to change the wallpaper
function Set-Wallpaper($path) {
    Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

    # Call function to change the wallpaper
    [Wallpaper]::SystemParametersInfo(20, 0, $path, 3)
}

# Change the wallpaper to the first image
Set-Wallpaper $wallpaper1

# Start MPV as a background process
$mpvProcess = Start-Process $mpvPath -ArgumentList "--ontop --border=no --no-osc --no-osd-bar --fullscreen --no-taskbar-progress $video" -PassThru
# Wait for the video to finish
Start-Sleep -Seconds 3

# Change the wallpaper to the second image
Set-Wallpaper $wallpaper2

# Stop the MPV process
$mpvProcess | Stop-Process

