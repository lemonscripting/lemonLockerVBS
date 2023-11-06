Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'cscript.exe' or Name = 'wscript.exe'")

For Each objProcess In colProcesses
    If InStr(objProcess.CommandLine, ".vbs") > 0 Then
        objProcess.Terminate()
    End If
Next
