﻿/*
2019.12.25   By:絕版大叔、 250740270

常用命令
*   异步    即使其他按键按下也能触发当前按键
~   保留    保留按键原有的功能 而不是全部接管

*/

; 跳过对话框并自动替换旧实例, 效果类似于 Reload 函数.
#SingleInstance Force

global isrun := False
global PressKey := False

; 全局开关
~*Home:: isrun := ! isrun

; 设置send发送按键默认延迟 毫秒
SetKeyDelay 200

#HotIf (WinActive("ahk_exe PathOfExile_x64Steam.exe") || WinActive("ahk_exe start_for_wegame.exe") || WinActive("ahk_exe PathOfExile_x64.exe")) && isrun

; 商店连续购买物品
Numpad4::{
    PressKey := !PressKey
    Send "{ctrl up}"
    If (PressKey)
        SetTimer "SendKey",200
    Else
        SetTimer "SendKey",0
}

; 点链接
Numpad5::{
    global PressKey := !PressKey
    If (PressKey)
        SetTimer "ItemLink",100
    Else
        SetTimer "ItemLink",0
}

ItemLink(){
    Send "{Shift down}{LButton}" ; 点链接
}

; 连发
SendKey(){
    ; Send "{Shift down}{LButton}"  ; 点链接
    Send "{ctrl down}{LButton}" ; 买东西
}

; 释放地雷 + 引爆
; ~*RButton up::{
;     Sleep(200)
;     Send("d")
~*Home::isrun := ! isrun

; #If WinActive("ahk_exe start_for_wegame.exe") && isrun
; #IF (WinActive("ahk_exe start_for_wegame.exe") || WinActive("ahk_exe PathOfExile_x64.exe")) && isrun
#HotIf (WinActive("ahk_exe start_for_wegame.exe") || WinActive("ahk_exe PathOfExile_x64.exe")) && isrun

; 释放地雷 + 引爆
; ~*RButton up::{
;     Sleep 200
;     Send "d"
; }

; 药 + 地雷 + buff
; *q::Send "12345d{Numpad1}{Numpad2}{Numpad3}"

; 位移 + 地雷 + buff
; ~*d::Send "q{Numpad1}{Numpad2}{Numpad3}"

; 传送
~*`:: Send "12345r"

~*z::Send "{Ctrl down}{Click}"
~*z up::Send "{Ctrl up}"

F5::searchImg()

searchImg(){
    A_Clipboard := "10"
    try
    {
        if ImageSearch(x, y, 0, 0, A_ScreenWidth/2, A_ScreenHeight,"*100 asd.png"){
            Click x+30, y+15
            Click x+30, y+15
            Click x+30, y+15
            Click x+30, y+15
            Sleep 200
            Send "{Ctrl down}a"
            Sleep 100
            Send "{Ctrl up}"
            Sleep 100
            Send "{Ctrl down}v"
            Sleep 100
            Send "{Ctrl up}"
            Sleep 100
            Send "{Enter}"

        }
        else
            MsgBox "Icon could not be found on the screen."
    }
    catch exc
        MsgBox "Could not conduct the search due to the following error:`n" exc.Message

}

; ; 烟雾地雷
; ~*r::{
;     Sleep(200)
;     Send "d"
; }

; 正火
; *v::Send "{MButton}"

;加速药 + 地雷 + buff
; *1::Send "q12345{Numpad1}{Numpad2}{Numpad3}d"

; 下矿 照明 地雷
~*2::Send "6r"
~*3::Send "7r"

; 下矿 蜡烛和炸弹
1:: Send "1234"
2:: Send "r6"
3:: Send "r7"

z:: Send "{Ctrl down}{Click}{Ctrl up}"

~*`:: Send "r"

z up:: Send "{Ctrl up}"

; 鼠标4 5键切换背包
XButton1::Send "{Right}"
XButton2::Send "{Left}"

ReCode(str, Pagecode){
    ; 在文件末尾处追加(写入) 文本或二进制数据(如果有必要, 首先创建文件).
    FileAppend str, "str"
    ; 打开文件
    file := FileOpen("str", "r")
    ; 删除文件
    FileDelete "str"
    ; 设置读取编码
    file.Encoding := Pagecode
    ; 读取字符串
    strA := file.Read()
    file.Close()
    ; 返回字符串
    return strA
}

; 仓库搜索
setClip(key){
    Send "^f"
    A_Clipboard := key
    Send "{Ctrl down}v"
    Sleep 100
    Send "{Ctrl up}"
}

sendStr(key){
    A_Clipboard := key
    Send "{Ctrl down}a"
    Sleep 100
    Send "{Ctrl up}"
    Send "{Ctrl down}v"
    Sleep 100
    Send "{Ctrl up}"
}

f2:: sendStr("地图")
f3:: setClip("戒指")
f4:: setClip('"a/b/o 1 c"')

; f5:: setClip("胸")

; 聊天信息命令
sendMsg(key){
    Send "{enter}"
    A_Clipboard := key
    Send "{Ctrl down}v"
    Sleep 100
    Send "{Ctrl up}"
    Send "{enter}"
}
; f6:: setClip("/藏身处")
f6::{

    If (WinActive("ahk_exe PathOfExile_x64Steam.exe"))
        Send sendMsg("/hideout")
    Else
        Send sendMsg("/藏身处")

    FindItem(str){
        ; ClipSaved := A_Clipboard ; 把整个剪贴板保存到您选择的变量中.
        ; ... 这里临时使用剪贴板, 比如快速粘贴大量文本 ...
        A_Clipboard := str ; 还原剪贴板. 注意这里使用 A_Clipboard(而不是 ClipboardAll).
        Send "^f"
        Send "{Ctrl down}v"
        Sleep 200
        Send "{Ctrl up}"
        ; A_Clipboard :=ClipSaved
        ; ClipSaved := "" ; 在剪贴板含有大量内容时释放内存.
    }

    f2::FindItem("手")
    f3::FindItem("头")
    f4::FindItem("腿")

    ; f6::SendMSG()

    Numpad1::SendMSG("/藏身处")
    ; 小退
    Numpad0::{
        SendMSG("/exit")
        Sleep 2000
        Send "{enter}"
    }

    SendMSG(str){
        Send "{enter}"
        Sleep 200
        A_Clipboard := str ; 还原剪贴板. 注意这里使用 A_Clipboard(而不是 ClipboardAll).
        Send "^f"
        Send "{Ctrl down}v"
        Sleep 200
        Send "{Ctrl up}"
        Send "{enter}"
    }

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
