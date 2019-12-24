; 跳过对话框并自动替换旧实例, 效果类似于 Reload 函数.
#SingleInstance Force
    
global isrun := Flash

*F1::isrun := ! isrun

; #If WinActive("ahk_exe start_for_wegame.exe") && isrun
#IF WinActive("ahk_exe start_for_wegame.exe") || WinActive("ahk_exe PathOfExile_x64.exe") && isrun


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
*1::Send "d{Numpad1}{Numpad2}{Numpad3}"

; 下矿 照明 地雷
~*2::Send "6"
~*3::Send "7"

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
XButton1::
    Send "{Right}"
Return

XButton2::
    Send "{Left}"
Return

; f2::Send "{enter}/2{enter}"
f3::Send "{enter}/1{enter}"
f4::Send "{enter}/c{enter}"
; f5::Send "{enter}/h{enter}"
f6::Send "{enter}/oos{enter}"