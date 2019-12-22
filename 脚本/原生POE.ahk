;启用或禁用可能产生错误的特定状况时的警告, 例如书写错误或缺少全局声明.
#Warn All
;覆盖之前运行的实力 不再提示 
#SingleInstance Force

ToBase(n,b){
    return (n < b ? "" : ToBase(n//b,b)) . ((d:=Mod(n,b)) < 10 ? d : Chr(d+55))
}



;home获取当前鼠标位置的颜色
; Home::
;     MouseGetPos, MouseX, MouseY
;     PixelGetColor, rgb, %MouseX%, %MouseY%, RGB
;     tmp := ToBase(rgb,10)
;     r := tmp & 0xff
;     g := (tmp >> 8) & 0xff
;     b := (tmp >> 16) & 0xff
;     clipboard := r " " g " " b
; Return



#IfWinActive, ahk_exe PathOfExile_x64.exe
;空格 吃345位置药水
;Space::
;Send {3}
;Send {4}
;Send {5}
;Return

;波浪号一键吃药
q::
Send {f}
Send {Numpad1}
Send {Numpad2}
Send {Numpad3}
Send {4}
Send {5}
Return

1::
Send {Numpad1}
Send {Numpad2}
Send {Numpad3}
Send {4}
; Send {r}
; Send {t}
Return

; 下矿 蜡烛和炸弹
2::
Send {6}
Return

3::
Send {7}
Return

; 鼠标4 5键切换背包
XButton1::
Send {Right}
Return

XButton2::
Send {Left}
Return


;F1升级宝石
f1::
    ;jn(1800,290,1914,812)
    xz()
Return

f2::Send {enter}/2{enter}
f3::Send {enter}/1{enter}
f4::Send {enter}/c{enter}
f5::Send {enter}/h{enter}
f6::Send {enter}/oos{enter}

jn(x1,y1,x2,y2){
    ;捉图坐标根据全屏坐标模式
   CoordMode, Pixel
    ;屏幕找图   获取技能升级坐标  
   ImageSearch, x, y, x1, y1, x2, y2, *160 %A_WorkingDir%\mydb\升级宝石.png 
   ;MsgBox, %x% %y%
    If ErrorLevel =0
    {
        ;模拟右击施放技能 暂停单位再点击
        Click down r
        ;记录鼠标当前位置
        MouseGetPos, oldx,oldy
       ; x+=10
        ;y+=10
        Click %x%, %y%, l
        Click up r
        ;模拟鼠标点击
        ;MouseClick, l,% x,% y
        ;移动鼠标 还原坐标
        MouseMove, % oldx, % oldy

        ;MouseClick, l,% oldx,% oldy
        ;Click %oldx%, %oldy%, l
        ;松开右击
        ;MsgBox, %x% %y%
    }
}

xz(){
; 捉图坐标根据全屏坐标模式
   CoordMode, Pixel
; 在鼠标位置400像素范围内搜索
   MouseGetPos, mx,my
   mx-=200
   my-=200
   mox:=mx + 400
   moy:=my + 400
;    MsgBox, %mx% %my% %mox% %moy%
    ;屏幕找图   获取技能升级坐标  
   ImageSearch, x, y, % mx, % my, mox, moy, *250 %A_WorkingDir%\mydb\箱子.png
   MsgBox, %x% %y% %A_WorkingDir%\mydb\箱子.png

    If ErrorLevel =0
    {
        ;记录鼠标当前位置
        MouseGetPos, oldx,oldy
       ; x+=10
        ;y+=10``
        ;鼠标左键点击
        Click %x%, %y%, l
        Click up r
        ;模拟鼠标点击
        ;MouseClick, l,% x,% y

        ;移动鼠标 还原坐标
        MouseMove, % oldx, % oldy

        ;MouseClick, l,% oldx,% oldy
        ;Click %oldx%, %oldy%, l
        ;松开右击
        ;MsgBox, %x% %y%
    }
}





;CMD命令执行脚本 
;AutoHotkeyU64 POE.ahk