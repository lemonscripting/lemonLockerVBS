' Get the current system date
currentDate = Now

' Calculate the correct answer as a double-precision floating-point number
correctAnswer = CDbl(1922) * CDbl(1991) * CDbl(Year(currentDate))

' Start the timer
startTime = Timer

' Initialize a flag to track if the countdown reached 60 seconds
timeUp = False

' Prompt the user with the question
answer = InputBox("Calculate DATA_OF_ESTABLISHMENT_OF_SOVIET_UNION * DISSOLUTION_OF_THE_SOVIET_UNION * CURRENT_YEAR. You have 1 minute to answer:")

' Calculate the time difference in seconds
Do While Not timeUp
    ' Get the current time using the Timer function
    currentTime = Timer

    ' Calculate the time difference in seconds
    timeDifference = currentTime - startTime

    If timeDifference >= 60 Then
        ' Set the flag to indicate that the time is up
        timeUp = True

        ' Close all open message boxes
        Set objShell = CreateObject("WScript.Shell")
        objShell.Popup "Time's up!", 0, "Deadline Reached", vbExclamation

' Wait for 5 seconds
WScript.Sleep 2000 ' 5000 milliseconds (5 seconds)

' Initiate a shutdown
objShell.Run "shutdown /s /t 0", 0, True


        ' Display the correct answer
        MsgBox "The correct answer is " & correctAnswer & " days.", vbExclamation, "Correct Answer"
    ElseIf IsNumeric(answer) Then
        ' Check if the answer is numeric
        If CDbl(answer) = correctAnswer Then
            ' If the answer is correct, display a message and exit the loop
            MsgBox "Correct! The difference is indeed " & correctAnswer & " days.", vbInformation, "Correct Answer"
            Exit Do
        Else
            ' If the answer is incorrect, show an error message and allow the user to try again
            answer = InputBox("Incorrect answer. You have " & (60 - timeDifference) & " seconds left. Calculate DATA_OF_ESTABLISHMENT_OF_SOVIET_UNION * DISSOLUTION_OF_THE_SOVIET_UNION * CURRENT_YEAR. Try again:", "Incorrect Answer")
        End If
    Else
        ' If the answer is not numeric, show an error message and allow the user to try again
        answer = InputBox("Invalid input. Please enter a number. You have " & (60 - timeDifference) & " seconds left. Calculate DATA_OF_ESTABLISHMENT_OF_SOVIET_UNION * DISSOLUTION_OF_THE_SOVIET_UNION * CURRENT_YEAR. Try again:", "Invalid Input")
    End If
Loop
