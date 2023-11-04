'change desktop image
Set objShell = CreateObject("WScript.Shell")
strDesktop = objShell.SpecialFolders("Desktop")
strLocalPath = strDesktop & "\test.png"
objShell.RegWrite "HKCU\Control Panel\Desktop\Wallpaper", strLocalPath
objShell.Run "%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters", 1, True
