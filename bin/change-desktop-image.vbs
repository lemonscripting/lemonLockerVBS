Set objShell = CreateObject("WScript.Shell")

Dim wshNetwork : Set wshNetwork = CreateObject("WScript.Network")
Dim strUsername : strUsername = wshNetwork.UserName

strLocalPath = "C:\Users\" & strUsername & "\Downloads\LemonZS.jpg"
WScript.Echo strLocalPath
objShell.RegWrite "HKCU\Control Panel\Desktop\Wallpaper", strLocalPath
objShell.Run "%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters", 1, True