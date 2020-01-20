#SingleInstance Force



MsgBox, 123
; 滚轮向前 提升音乐
!WheelDown:: Send "{Volume_Down}"

; 滚轮向后 降低音乐
!WheelUp::Send "{Volume_Up}"