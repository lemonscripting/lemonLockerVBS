Set objShell = CreateObject("WScript.Shell")
objShell.Run "taskkill /f /im explorer.exe", 0, True
WScript.Sleep 3000
objShell.Run "explorer.exe", 0, True
Set objShell = Nothing
