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