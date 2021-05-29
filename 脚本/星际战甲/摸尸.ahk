
#SingleInstance Force

; 总开关
global isOn := False

; 脚本开关 计时器开关
global isRun :=False

~*Home::isOn := ! isOn

#HotIf (WinActive("ahk_exe Warframe.x64.exe") ) && isOn

Numpad1::TimeProxy("jiasu")
Numpad2::TimeProxy("HeroMove")
Numpad3::TimeProxy("HeroMoveW")
Numpad4::SendMSG("打工摸求组 虚空生存")

e::{
    Send "{ctrl down}"
    Sleep 100
    Send "e"
    Sleep 500
    Send "{ctrl up}"
}

; 挂机  前后走动
SendMSG(msg){
    Send "t"
    Sleep 200
    Send msg . random(1,100)
    Send "{enter}"
}

; 挂机  前后走动
HeroMove(){
    Send "{w down}"
    Sleep 1000
    Send "{w up}"
    Sleep 1000
    Send "{s down}"
    Sleep 1000
    Send "{s up}"
    Sleep 1000
}

SendMSG(msg){
    Send "t"
    Sleep 100
    Send msg
    Sleep 100
    Send "{enter 4}"
}

; 挂机  前后走动
HeroMoveW(){
    Click
    Sleep 1000
    Send "{r}"
    Sleep 1000
}

; 加速娃 挂机
jiasu(){
    Send "4"
    Sleep 2000
    Send "{a down}"
    Sleep 1000
    Send "{a up}"
    Sleep 2000
    Send "{d down}"
    Sleep 1000
    Send "{d up}"
}

;  代理计时器
TimeProxy(fun){
    isRun := ! isRun
    If (isRun)
        SetTimer fun,200
    Else
        SetTimer fun,0
}
