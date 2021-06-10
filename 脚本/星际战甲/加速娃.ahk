#SingleInstance Force

; 定义一个总开关变量
global isRun := False

global PressKey := False

; 使用home按键控制
; ~*Home:: isRun := ! isRun
~*Home:: SetTimer "MSG",0

; 当游戏处于前台状态 并且 已经打开总开关 才执行
; #HotIf (WinActive("ahk_exe Warframe.x64.exe")) ; && isrun

; 快捷开关
; global PressKey := False
; ~*Numpad1::{
;     PressKey := !PressKey
;     If (PressKey)
;         SetTimer "jaisu",100
;     Else
;         SetTimer "jaisu",0
; }

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

Numpad2::poxyz("mosi")
Numpad3::poxyz("yinshen")

; 指挥官循环隐身
yinshen(){
    Send "v"
    Sleep 8000
    Send "v"
    Sleep 4000
}

; 计时器
poxyz(fun){
    PressKey := !PressKey
    If (PressKey)
        SetTimer fun,100
    Else
        SetTimer fun,0
}

; 回城
; b::SendMSG("/unstuck")

Numpad1::{
    ; SendMSGProxy("求组杆子车(摸尸/加速)")
    msg:="随机匹配了火卫2 隔离库(等级3) 这个任务，当任务完成后准备回撤离点的时候，队长放弃任务导致任务失败，奖励也没了浪费了我十多分钟，请惩罚这种而已放弃任务的行为。"
    SendMSGProxy(msg)
}

; 使用全局变量来代替参数 传参不会产生函数被重复执行的问题
; 1秒抖动
SendMSGProxy(msg,times:=1000){
    global Gmsg:=msg
    SetTimer "time",times
    time(){
        SetTimer ,0
        SendMSG(Gmsg)
    }
}

; 发送消息
SendMSG(msg){
    Send "t"
    Sleep 200
    Send msg . random(1,100)
    Send "{enter}"
}
