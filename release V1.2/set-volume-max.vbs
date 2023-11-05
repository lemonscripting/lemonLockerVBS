Set objShell = CreateObject("WScript.Shell")
Do
    ' Set the system volume to maximum
    objShell.Run "nircmd.exe setsysvolume 65535", 0, True
    
    ' Wait for 100 milliseconds
    WScript.Sleep 100
Loop
