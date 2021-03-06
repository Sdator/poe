﻿/*
2019.12.25   By:絕版大叔、 250740270

常用命令
*   异步    即使其他按键按下也能触发当前按键
~   保留    保留按键原有的功能 而不是全部接管

*/

; 跳过对话框并自动替换旧实例, 效果类似于 Reload 函数.
#SingleInstance Force

global isrun := False
~*Home::isrun := ! isrun

; 迷踪计时器开关
; Numpad4::{
;     SetTimer "qwloop",0
;     SetTimer "wloop",0

; }

#HotIf (WinActive("ahk_exe start_for_wegame.exe") || WinActive("ahk_exe PathOfExile_x64.exe")) && isrun

; ============================
; 技能配置
; ============================

; 辅助技能1 迷踪
global S1 := "q"
global S2 := "rf"
; ~ 辅助一键吃药 q凋零步 f战吼
global S3 := "qf"

; Q技能 移动+吃药
*q::{
    Send "12345" S1
    SetTimer "qwloop",7000
    SetTimer "wloop",0
}

; ~*e:: Send "wq12345"

; 接一波迷踪
qwloop(){
    ; Send "12345" S2
    SetTimer , 0
    SetTimer "wloop",500

}
; 循环释放 w
wloop(){
    ; 鼠标左键是按下状态才会触发
    If ( GetKeyState("LButton") and WinActive("ahk_exe start_for_wegame.exe") and isrun)
        Send S2
}

; W技能 移动+吃药
; *w::Send "12345" S2

; 配合系统一键吃药  放个 q 位移技能
~*`:: {
    Send S3
    SetTimer "qwloop",6000
    SetTimer "wloop",0
}

; 配合系统一键吃药  放个 q 位移技能
t:: {
    Send "{Ctrl down}qwert{Ctrl up}"

}

; ============================
; 下矿技能 蜡烛和炸弹
; ============================
; *1:: Send "wq12345"
*2:: Send "r6"
*3:: Send "r7"

; 快速点击物品存放到背包
z:: Send "{Ctrl down}{Click}"
z up:: Send "{Ctrl up}"

; 鼠标4 5键切换背包
XButton1::Send "{Right}"
XButton2::Send "{Left}"

; 0 小退
F4::{
    SendMSG("/exit")
    Sleep 2000
    Send "{enter}"
}

; 1 藏身处
F1::SendMSG("/藏身处")
F2::FindItem("depth:200")
F3::FindItem('"o [0-1][0-9] ch" "20 /"')
F5::InStr "探索物品"
F6::InStr "分裂化石"

Numpad7::SendMSG("/游戏时间")
Numpad8::SendMSG("/剩余怪物")
Numpad9::SendMSG("/创角时间")

; ============================================
; 功能函数
; ============================================

InStr(str){
    A_Clipboard := str ; 还原剪贴板. 注意这里使用 A_Clipboard(而不是 ClipboardAll).
    Send "{Ctrl down}v"
    Sleep 200
    Send "{Ctrl up}"
}

SendMSG(str){
    Send "{enter}"
    Sleep 200
    ; A_Clipboard := str ; 还原剪贴板. 注意这里使用 A_Clipboard(而不是 ClipboardAll).
    Send "^f"
    ; Send "{Ctrl down}v"
    InStr(str)
    Send "{enter}"
}

FindItem(str){
    ; ClipSaved := A_Clipboard ; 把整个剪贴板保存到您选择的变量中.
    ; ... 这里临时使用剪贴板, 比如快速粘贴大量文本 ...
    ; A_Clipboard := str ; 还原剪贴板. 注意这里使用 A_Clipboard(而不是 ClipboardAll).
    ; ctrl + f 定位到搜索框
    Send "^f"
    ; 粘贴
    ; Send "{Ctrl down}v"
    InStr(str)

    ; A_Clipboard :=ClipSaved
    ; ClipSaved := "" ; 在剪贴板含有大量内容时释放内存.
}

; j 刷图中使用回城
j::{
    ; 捉图坐标根据全屏坐标模式
    CoordMode "Pixel"
    ;屏幕找图
    try
    {
        Send "i"
        Sleep 400
        err := ImageSearch(x, y, A_ScreenWidth/2, A_ScreenHeight/2, A_ScreenWidth, A_ScreenHeight, "*100 data\回城卷.png")
        Sleep 100
        if (err = 1 ) {
            Click "Right",x, y
        }
    } catch e {
        MsgBox "错误：" e
    }
}

/*
; 功能键
; f2::Send "{enter}/2{enter}"
f3::Send "{enter}/1{enter}"
f4::Send "{enter}/c{enter}"
; f5::Send "{enter}/h{enter}"
f6::Send "{enter}/oos{enter}"

*/
; A_WorkingDir  脚本所在目录
