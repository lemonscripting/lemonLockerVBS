Set objShell = CreateObject("WScript.Shell")
Set objWMPlayer = CreateObject("WMPlayer.OCX")

' Special folder location for the desktop
strDesktop = objShell.SpecialFolders("Desktop")

' Path to the music file on the desktop
strMusicPath = strDesktop & "\music.mp3"

' Create a Windows Media Player instance
objWMPlayer.URL = strMusicPath

' Configure the player for continuous loop
objWMPlayer.settings.setMode "loop", True

' Set the player to play continuously
objWMPlayer.settings.setMode "autoRewind", True

' Play the music
objWMPlayer.controls.play

' Sleep for a long time to keep the script running
WScript.Sleep 86400000 ' Sleep for 24 hours (adjust as needed)
