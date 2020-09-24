
#SingleInstance Force 

global isrun
global PressKey := True

; home开关
*Home::
    PressKey := False
    isrun := ! isrun
return 

; 右击取消 或 左边松开
; ~*RButton::
~*RButton up::
    PressKey := True
return


#IF WinActive("ahk_exe Diablo III.exe") && isrun
; 按 F1 开启或关闭
F1:: 
    SetTimer "SendKey",500
    PressKey := ! PressKey
return

; 按住左击 键开启连发
~*RButton::
    PressKey := False
    ; 计时器循环运行
    SetTimer "SendKey",500
return


; 连发
SendKey(){
    Send "{RButton}"
    ; 关闭计时器
    If (PressKey){
        SetTimer , 0
    }
}
