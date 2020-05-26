#SingleInstance, Force
    #KeyHistory, 0
SetBatchLines, -1
ListLines, Off
SendMode Input ; Forces Send and SendRaw to use SendInput buffering for speed.
SetTitleMatchMode, 3 ; A window's title must exactly match WinTitle to be a match.
SetWorkingDir, %A_ScriptDir%
SplitPath, A_ScriptName, , , , thisscriptname
#MaxThreadsPerHotkey, 1 ; no re-entrant hotkey handling
; DetectHiddenWindows, On
; SetWinDelay, -1 ; Remove short delay done automatically after every windowing command except IfWinActive and IfWinExist
; SetKeyDelay, -1, -1 ; Remove short delay done automatically after every keystroke sent by Send or ControlSend
; SetMouseDelay, -1 ; Remove short delay done automatically after Click and MouseMove/Click/Drag

SetKeyDelay, 1000

F1::
    MouseGetPos, x,y
Return

F2::
    MsgBox, "111"
    Send {Click x,y} 
Return


Home::
    
    Loop, 5{
        Sleep, 1000
        str := A_Index<10 ? "0" A_Index : A_Index
        Send {Enter}
        Send {Click x,y} 
        Send %str% 
        Send {Enter}
        
    }
    
Return

