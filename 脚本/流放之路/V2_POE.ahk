﻿/*
2019.12.25   By:絕版大叔、 250740270

常用命令
*   异步    即使其他按键按下也能触发当前按键 
~   保留    保留按键原有的功能 而不是全部接管

*/

; 跳过对话框并自动替换旧实例, 效果类似于 Reload 函数.
#SingleInstance Force 

global isrun

*F1::isrun := ! isrun

; #If WinActive("ahk_exe start_for_wegame.exe") && isrun
#IF (WinActive("ahk_exe start_for_wegame.exe") || WinActive("ahk_exe PathOfExile_x64.exe")) && isrun
    

; 释放地雷 + 引爆
~*RButton up::
    Sleep(200)
    Send "d"
Return

; 药 + 地雷 + buff
*q::Send "12345d{Numpad1}{Numpad2}{Numpad3}"

; 位移 + 地雷 + buff
~*d::Send "q{Numpad1}{Numpad2}{Numpad3}"

; 传送
*f::Send "{Numpad4}"

; 正火
*v::Send "{MButton}"

;加速药 + 地雷 + buff
*1::Send "q12345{Numpad1}{Numpad2}{Numpad3}d"

; 下矿 照明 地雷
~*2::Send "d6"
~*3::Send "d7"

/*
; 下矿 蜡烛和炸弹
2::
    Send {6}
Return

3::
    Send {Numpad5}
    Send {7}
Return
*/

; 鼠标4 5键切换背包
XButton1::Send "{Right}"
XButton2::Send "{Left}"

f2::Send "手"
f3::Send "头"
f4::Send "腿"
f5::Send "戒指"
f6::Send "护甲"

/*
; 功能键
; f2::Send "{enter}/2{enter}"
f3::Send "{enter}/1{enter}"
f4::Send "{enter}/c{enter}"
; f5::Send "{enter}/h{enter}"
f6::Send "{enter}/oos{enter}"

*/

