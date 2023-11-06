set oShell = CreateObject("WScript.Shell") 
oShell.run"%SystemRoot%\System32\SndVol.exe" 'Runs The Master Volume App.
WScript.Sleep 1500 'Waits For The Program To Open
oShell.SendKeys("{PGUP}") 'Turns Up The Volume 20, If It Is Muted Then It Will Unmute It
oShell.SendKeys("{PGUP}") 'Turns Up The Volume 20
oShell.SendKeys("{PGUP}") 'Turns Up The Volume 20
oShell.SendKeys("{PGUP}") 'Turns Up The Volume 20
oShell.SendKeys("{PGUP}") 'Turns Up The Volume 20
oShell.SendKeys"%{F4}"  ' ALT F4 To Exit The App.