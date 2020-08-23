Dim wshShell, strFilePath, strProgPath, fso
Set wshShell = CreateObject( "WScript.Shell" )
Set fso = CreateObject( "Scripting.FileSystemObject" )
strProgPath = "C:\Program Files (x86)\NIT-Projects-Environments\"
strFilePath = "LoadAllDistribHidden.bat"
if fso.FileExists( strProgPath & strFilePath ) then
    wshShell.Run "cmd /c CD /d " & """" & strProgPath & """" & " && " & """" & strFilePath & """", 0, true
    TimeSleep( 10 )
else
'    MsgBox "File " & strFilePath & " Not Found", 0, "Error"
end if
strProgPath = "C:\Program Files\NIT-Projects-Environments\"
strFilePath = strProgPath & "LoadAllDistribHidden.bat"
if fso.FileExists( strFilePath ) then
    wshShell.Run "cmd /c CD /d " & """" & strProgPath & """" & " && " & """" & strFilePath & """", 0, true
    TimeSleep( 10 )
else
'    MsgBox "File " & strFilePath & " Not Found", 0, "Error"
end if
Sub TimeSleep ( delim )
	Dim dteWait
	dteWait = DateAdd("s", delim, Now())
	Do Until (Now() > dteWait)
		Loop
End Sub 
