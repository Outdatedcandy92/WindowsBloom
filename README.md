
# Windows Bloom Animation

This app schedules a powershell script which upon startup is triggered and you see a windows bloom animation.  
The app uses powershell to change wallpapers and play a animation using MPV.

## Usage/Examples
This is an example of what will happen at startup

![preview](https://github.com/Outdatedcandy92/WindowsBloom/assets/138517406/cc406897-2e82-470a-aeb0-25eb4bb3934b)

## Installation

To set this up on your device follow the instructions below

1. Download and open the folder
```bash
  git clone https://github.com/Outdatedcandy92/WindowsBloom.git
```
2. Run install.bat
> **Important:**  Make sure to run it as administrator or it will not be able to schedule task.
```bash
  pip install -r requirments.txt
```

After install.bat is complete you are done and now will be shown the animation at startup everytime
## Customize

To add custom videos/wallpaper-
> **Important:**  The name of your custom files should be `startup.mp4` & `close.mp4`
1. Go into `WindowsBloom\media`
2. Replace `startup.mp4` with your custom animation
3. Replace `close.mp4` with your custom animation
4. `img.png` should be a image of your wallpaper
5. `start.png` should preferably be a solid color
