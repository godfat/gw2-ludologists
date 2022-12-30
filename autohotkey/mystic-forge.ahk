#NoEnv         ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn          ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#IfWinActive Guild Wars 2
#MaxThreadsPerHotkey 2

Toggle := false
Max := 50

F10::
  CoordMode, ToolTip, Screen
  MouseGetPos, bottonRefillX, bottonRefillY
Return

F11::
  CoordMode, ToolTip, Screen
  MouseGetPos, bottonForgeX, bottonForgeY
Return

F12::
  Toggle := !Toggle
  Iteration := 0
  While bottonRefillX && bottonForgeX && Toggle && Iteration < Max {
    Click, %bottonRefillX%, %bottonRefillY%
    Sleep 25
    Click, %bottonForgeX%, %bottonForgeY%
    Sleep 2200
    Iteration += 1
  }
  Toggle := false
Return
