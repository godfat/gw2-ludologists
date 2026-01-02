#NoEnv         ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn          ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

; This script is for farming Colour of Lumina in Clair Obscur: Expedition 33
; Go talk to the merchant in Renoir's Drafts, stop at:
;   [Trade]
;   [Leave]
; Then press F1 to start the script. This will fight the merchant and
; pick the character at your cursor location to duel the merchant, and
; keep going for `Max` number of times. Press F1 again to stop it earlier.
; You should wait until it stops at the dialog though, letting it finish
; the current iteration.
; Note that the character you choose should have a oneshot skill at the
; 3rd skill. In my case I am using Lune with Hell.
; Another note is that you likely want to restart the game after 50 times,
; because the game can become slower with each iteration, possibly due to
; resource leak. Restart the game will make it fast again.

#IfWinActive Clair Obscur: Expedition 33
#MaxThreadsPerHotkey 2

Toggle := false
Max := 50

F1::
  Toggle := !Toggle
  Iteration := 0
  While Toggle && Iteration < Max {
    Send, s ; Dialog down
    Sleep, 500
    Send, f ; Trade
    Sleep, 200
    Send, {e down} ; Duel
    Sleep, 2000
    Send, {e up}
    Click down ; Select character at the cursor location
    Sleep, 2500
    Click up
    Sleep, 4000 ; Wait for battle
    Send, e ; Skill
    Sleep, 1000
    Send, e ; The 3rd skill, Hell in my case
    Sleep, 500
    Send, f ; Select targets
    Sleep, 7000
    Send, f ; Confirm battle result
    Sleep, 5000 ; This takes longer over time, maybe due to resource leak
    Send, f ; Confirm dialog
    Sleep, 500
    Iteration += 1
  }
  Toggle := false
Return
