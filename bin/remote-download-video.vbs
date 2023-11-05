dim xHttp: Set xHttp = createobject("Microsoft.XMLHTTP")
dim bStrm: Set bStrm = createobject("Adodb.Stream")
xHttp.Open "GET", "YOUR_URL.mp3", False
xHttp.Send

Dim wshNetwork : Set wshNetwork = CreateObject("WScript.Network")
Dim strUsername : strUsername = wshNetwork.UserName

with bStrm
    .type = 1 
    .open
    .write xHttp.responseBody
    .savetofile "C:\Users\" & strUsername & "\Downloads\LemonZS.mp3", 2 
end with