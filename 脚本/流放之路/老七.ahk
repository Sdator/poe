
#SingleInstance Force 

global PressKey := False

; r 键开启连发
r up::
    PressKey := True
    ; 计时器循环运行
    SetTimer "SendKey",200
return

; 右击取消
~*RButton::
    PressKey := False
    Send "{r up}"
return

; 连发
SendKey(){
    If (PressKey){
        Send "{r down}"
        return
    }
    SetTimer , 0
}
