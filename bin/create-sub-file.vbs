Set objFSO = CreateObject("Scripting.FileSystemObject")
strUsername = CreateObject("WScript.Network").UserName
strFolder = "C:\Users\" & strUsername & "\Downloads"
strFile = strFolder & "\LemonZS.vbs"

' Array of lines to write to the file
lines = Array( _
    "Set objShell = CreateObject(""WScript.Shell"")", _
    "Dim wshNetwork : Set wshNetwork = CreateObject(""WScript.Network"")", _
    "Dim strUsername : strUsername = wshNetwork.UserName", _
    "strLocalPath = ""C:\Users\" & strUsername & "\Downloads\LemonZS.jpg""", _
    "objShell.RegWrite ""HKCU\Control Panel\Desktop\Wallpaper"", strLocalPath", _
    "objShell.Run ""%windir%\System32\RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters"", 1, True" _
)

' Create the file and write content to it
Set objFile = objFSO.CreateTextFile(strFile, True)
For Each line In lines
    objFile.WriteLine line
Next
objFile.Close
