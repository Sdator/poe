; 2019.1.21  AIR 250740270
; 跳过对话框并自动替换旧实例, 效果类似于 Reload 函数.
#SingleInstance Force

global PressKey := False
global isKeyUP := False

; 按住
; Home::{
;     PressKey := ! PressKey
;     if PressKey
;         Send "{Click Down}"
;     else
;         Send "{Click Up}"
; }

; ~ 触发热键时, 热键中按键原有的功能不会被屏蔽
; * 即使额外的修饰键被按住也能触发热键
; ========================
;            连点
; =========================
; 计数器
global num := 0
global numUP := 0

; home、右击取消

~*LButton up::{
    PressKey := False
    numUP+=1
    OutputDebug "左键或右键弹起" . numUP
}

Home::{
    PressKey := !PressKey
    SetTimer "SendKey",1
}

global isOnClick:=False
global xy
End::{
    isOnClick := !isOnClick
    if isOnClick
    {
        ; 记录程序启动瞬间的鼠标位置,用于默认点击
        MouseGetPos nx,ny
        xy := Format("NA X{1} Y{2}",nx,ny)
        SetTimer "AutoClick",1
    }
    else
        SetTimer "AutoClick",0

    ; MsgBox(control_handle)
    ; 获得控件
    ; ControlGetHwnd
    ; arr := []
    ; arr.Push([822,370])
    ; arr.Push([514,622])
    ; arr.Push([810,568])
    ; arr.Push([822,370])
    ; i:=0
    ; For k,v in arr{
    ;     OutputDebug v[1] ":" v[2]
    ;     ControlClick ,"Cunt Empire - Google Chrome",,"LEFT",,"NA X" v[1] " Y" v[2]
    ; }
    ; SetControlDelay -1
    ; WM_PARENTNOTIFY := 0x210
    ; WM_LBUTTONDOWN := 0x201
    ; WM_LBUTTONUP := 0x202
    ; WM_WINDOWPOSCHANGING := 0x46
    ; WM_CAPTURECHANGED := 0x215

    ; SendMessage WM_PARENTNOTIFY, WM_LBUTTONDOWN, 0xEE00D3, , "Cunt Empire - Google Chrome"
    ; PostMessage WM_WINDOWPOSCHANGING, 0, 0xBFE030, , "Cunt Empire - Google Chrome"
    ; PostMessage WM_LBUTTONUP, 0, 0xEE00D3, , "Cunt Empire - Google Chrome"
    ; SendMessage WM_CAPTURECHANGED, 0, 0, , "Cunt Empire - Google Chrome"

}

; 后台自动点击
AutoClickA(){
    ; ControlClick ,"Cunt Empire - Google Chrome",,"LEFT",,"NA X405 Y356"
    OutputDebug 2222222
    ; ControlClick ,"Cunt Empire - Google Chrome",,"LEFT",,"NA X309 Y338"
}

global x:=0,y:=0,lx:=0,ly:=0

; 后台自动点击
AutoClick(){
    ; 实时坐标
    MouseGetPos x,y
    if(x == lx)
        ControlClick ,"Cunt Empire - Google Chrome",,"LEFT",,xy

    ; 上一次的坐标
    lx := x
}

; 按下左击或F1 键开启连发
~*LButton::
    {
        num+=1
        PressKey := True
        OutputDebug "按下" . num
        Sleep(500)
        ; 计时器循环运行
        ; SetTimer "isDown",50
        SetTimer "SendKey",0
        ; SetTimer "test",50
        ; SetTimer "SendKey",50
        ; return
    }
    ; 连发
    SendKey(){
        ; 按住连发
        If (PressKey) {
            Send "{LButton}"
        } Else SetTimer , 0
    }

    test(){
        If (Getkeystate("LButton","P")){
            OutputDebug "1111"
        }else OutputDebug "2222"

        if(PressKey) {
            OutputDebug "1111PressKey"
        } else OutputDebug "2222PressKey"

        If (!PressKey){
            SetTimer , 0
        }
    }
