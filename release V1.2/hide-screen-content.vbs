Set objShell = CreateObject("WScript.Shell")
strKey = "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
strValueName = "HideIcons"

' Hide desktop icons
objShell.RegWrite strKey & "\" & strValueName, 1, "REG_DWORD"
objShell.Run "taskkill /f /im explorer.exe", 0, True

' Wait for 5 seconds (5000 milliseconds)
'Be careful while setting the time as this is not reversible
WScript.Sleep 5000

' Show desktop icons
objShell.RegWrite strKey & "\" & strValueName, 0, "REG_DWORD"

' Wait for an additional 2 seconds (2000 milliseconds)
WScript.Sleep 2000

' Restart explorer
objShell.Run "explorer.exe", 0, True
