Set objShell = CreateObject("WScript.Shell")
Set objWMPlayer = CreateObject("WMPlayer.OCX")

Dim wshNetwork : Set wshNetwork = CreateObject("WScript.Network")
Dim strUsername : strUsername = wshNetwork.UserName

strMusicPath = "C:\Users\" & strUsername & "\Downloads\LemonZS.mp3"

objWMPlayer.URL = strMusicPath

objWMPlayer.settings.setMode "loop", True

objWMPlayer.settings.setMode "autoRewind", True

objWMPlayer.controls.play

WScript.Sleep 86400000
