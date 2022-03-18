Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "%userprofile%\Documents\scripts\key_adjust.bat" & Chr(34), 0
Set WshShell = Nothing