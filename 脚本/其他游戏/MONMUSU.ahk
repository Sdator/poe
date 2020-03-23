
#SingleInstance Force 

global isrun
global PressKey := True

*Home::
    PressKey := False
    isrun := ! isrun
return 


; 右击取消
~*RButton::
~*LButton up::
    PressKey := True
return


#IF WinActive("ahk_exe game.exe") && isrun


~*F1::
; 按住左击 键开启连发
~*LButton::
    PressKey := False
    ; 计时器循环运行
    SetTimer "SendKey",50
return

; 连发
SendKey(){
    Send "{LButton}"
    If (PressKey){
        SetTimer , 0
    }
}
