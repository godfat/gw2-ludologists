#NoEnv         ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn          ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#IfWinActive, ahk_class ArenaNet_Dx_Window_Class
#MaxThreadsPerHotkey 2

Toggle := false
Items := []
Times := 50

F10::
  If Toggle
    Return
  MouseGetPos, x, y
  Items.Push([x, y])
Return

F12::
  If Toggle
    Return
  Items := []
Return

F11::
  If Items.length() != 5
    Return
  Toggle := !Toggle
  N := 0
  outer:
  While Toggle && N < Times {
    For index, pos in Items {
      If Toggle = false
        Break outer
      Else If index <= 4
        MouseClick, Left, pos[1], pos[2], 2, 25
      Else
        Break
    }
    If Toggle = false
      Break
    MouseClick, Left, Items[5, 1], Items[5, 2]
    Sleep 2200
    If Toggle = false
      Break
    N := N + 1
  }
Return
