#NoEnv         ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn          ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#IfWinActive, ahk_class ArenaNet_Dx_Window_Class
#MaxThreadsPerHotkey 2
Toggle = 0

F9::
  Toggle := !Toggle
  While Toggle {
    MouseClick, left
    Sleep 25
  }
Return
