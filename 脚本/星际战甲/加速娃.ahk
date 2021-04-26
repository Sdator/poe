#SingleInstance Force

; 定义一个总开关变量
global isRun := False

global PressKey := False

; 使用home按键控制
~*Home:: isRun := ! isRun

; 当游戏处于前台状态 并且 已经打开总开关 才执行
#HotIf (WinActive("ahk_exe Warframe.x64.exe")) && isrun

; 快捷开关
global PressKey := False
~*Numpad1::{
    PressKey := !PressKey
    If (PressKey)
        SetTimer "jaisu",100
    Else
        SetTimer "jaisu",0
}

; 加速娃 防踢挂机脚本
jaisu(){
    Send "4"
    Sleep 2000
    Send "{a down}"
    Sleep 1000
    Send "{a up}"
    Sleep 1000
    Send "{d down}"
    Sleep 1000
    Send "{d up}"
    Sleep 100
}

Numpad1::SendMSG("求组杆子车(摸尸/加速)")

Numpad2::poxyz("mosi")
Numpad3::poxyz("yinshen")

; 指挥官循环隐身
yinshen(){
    Send "v"
    Sleep 8000
    Send "v"
    Sleep 4000
}

; 回城
b:: SendMSG("/unstuck")

; 计时器
poxyz(fun){
    PressKey := !PressKey
    If (PressKey)
        SetTimer fun,100
    Else
        SetTimer fun,0
}

mosi(){

    #SingleInstance Force

    ; 总开关
    global isOn := False

    ; 脚本开关 计时器开关
    global isRun :=False

    ~*Home::isOn := ! isOn

    #HotIf (WinActive("ahk_exe Warframe.x64.exe") ) && isOn

    Numpad1:: TimeProxy("jiasu")
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
