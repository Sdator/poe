#SingleInstance Force

; Home::
;     MsgBox PressKey
;     PressKey := ! PressKey
;     loop {

;         SetTimer("myhalfsec",1000)

;         if PressKey
;         {
;             break
;         }
;     }

; Return

global PressKey := false

Home::{
    PressKey := !PressKey
    ; If (PressKey)
    ;     SetTimer "clickLoop",100
    ; Else
    ;     SetTimer "clickLoop",0
}

#HotIf PressKey

x:=0,y:=0,x1:=0,y1:=0

clickLoop(){
    global x,y,x1,y1
    Click(x1, y1)
    Sleep 100
    Click(x, y)
    ; MsgBox x ":" y "," x1 ":" y1
}

isnot := false
Insert::{
    global x,y,x1,y1,isnot := !isnot
    If (isnot)
        MouseGetPos x, y
    Else
        MouseGetPos x1, y1
}

; Air 250740270 2019.12.21
